# ============================================
# Intro to R: LEGO Sets (Prices & Pieces)
# Gentle EDA + Missing Data basics (R only)
# Packages: readr, dplyr, ggplot2, janitor
# File needs: name, theme, year, pieces, usd_msrp
# ============================================
library(readr)
library(dplyr)
library(ggplot2)
library(janitor)

# Read & clean ------------------------------------------------
lego <- read_csv("lego.csv", show_col_types = FALSE) |>
  clean_names()

# If needed (uncomment):
# lego <- lego |>
#   rename(pieces = num_parts, usd_msrp = retail_price)

names(lego)
dim(lego)
head(lego, 5)

# Q1 — Summarize ----------------------------------------------
lego |>
  summarise(
    rows = n(),
    cols = ncol(lego),
    avg_pieces = mean(pieces, na.rm = TRUE),
    avg_price  = mean(usd_msrp, na.rm = TRUE),
    first_year = min(year, na.rm = TRUE),
    last_year  = max(year, na.rm = TRUE)
  )

lego %>% ggplot(aes(x = pieces)) +
  geom_histogram(bins = 30, color = "white", fill = "steelblue") +
  labs(title = "Distribution of LEGO Set Piece Counts",
       x = "Pieces", y = "Count") 

# Q2 — Missing data overview ---------------------------------
missing <- lego %>% is.na() %>% colSums()
missing_frame <- data.frame(columns = names(missing), 
                            na_count = as.numeric(missing), 
                            na_percent = as.numeric(missing)/dim(lego)[1])
print(missing_frame)

missing_frame %>% ggplot(aes(x=columns, y=na_percent)) + 
  geom_bar(stat='identity') + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# Q3 — Value (PPP) -------------------------------------------
# Naive definition ignoring NAS
# lego |> mutate(ppp = usd_msrp/pieces)
lego <- lego %>% filter(pieces>0) %>% 
  mutate(ppp=usd_msrp/pieces, na.rm=TRUE) 

lego |>
  filter(pieces >= 100, is.finite(ppp)) |>
  arrange(ppp) |>
  select(name, theme, year, pieces, usd_msrp, ppp) |>
  print(n=50)

# Distribution including outliers (notice the crazy high price to piece ratios)
ggplot(lego |> filter(!is.na(ppp)), aes(x = ppp)) +
  geom_histogram(bins = 30, color = "white", fill = "seagreen") +
  labs(title = "Distribution of Price per Piece (PPP)",
       x = "USD per piece", y = "Count")

# Examine what's causing those crazy high ppp's 
lego |>
  arrange(desc(ppp)) |>
  select(name, theme, year, pieces, usd_msrp, ppp) |>
  print(n=10)

# Optional view with outlier trim for cleaner shape
lego_trim <- lego |> filter(!is.na(ppp), ppp > 0, ppp < 1.5)
ggplot(lego_trim, aes(x = ppp)) +
  geom_histogram(bins = 30, color = "white", fill = "seagreen") +
  labs(title = "PPP (filtered < $1)",
       x = "USD per piece", y = "Count")

# Q4 — Themes compared ---------------------------------------
theme_summary <- lego |>
  filter(!is.na(ppp)) |>
  group_by(theme) |>
  summarise(
    sets = n(),
    avg_ppp = mean(ppp, na.rm = TRUE),
    avg_pieces = mean(pieces, na.rm = TRUE),
    .groups = "drop"
  ) |>
  filter(sets >= 10) |>
  arrange(avg_ppp)

print(theme_summary, n = 100)

top40 <- theme_summary |> slice_min(avg_ppp, n = 40)

ggplot(top40, aes(x = reorder(theme, avg_ppp), y = avg_ppp)) +
  geom_col(fill = "tan3") +
  coord_flip() +
  labs(title = "Top 10 Themes by Value (Lowest Avg PPP)",
       x = "Theme", y = "Average USD per piece")


# (Illustration of why an all-themes boxplot can be messy)
lego |> filter(!is.na(ppp)) |> ggplot(aes(x = theme, y = usd_msrp)) + coord_flip() + geom_boxplot()

# Q5 — Two-theme comparison ----------------------------------
themes_to_compare <- c("Star Wars", "Harry Potter")  # edit these as desired

pair <- lego |> filter(theme %in% themes_to_compare)

pair |> group_by(theme) |>
  summarise(
    sets = n(),
    avg_price  = mean(usd_msrp, na.rm = TRUE),
    avg_pieces = mean(pieces,   na.rm = TRUE),
    avg_ppp    = mean(ppp,      na.rm = TRUE),
    .groups = "drop"
  )
# Compared Distribution Plots
# Boxplot 
ggplot(pair |> filter(!is.na(usd_msrp)),
       aes(x = theme, y = usd_msrp)) +
  geom_boxplot(fill = "skyblue") +
  labs(title = "Price by Theme (choose two)",
       x = "Theme", y = "Price (USD)")
# Histograms
pair %>% ggplot(aes(x=ppp)) + geom_histogram() + 
  facet_wrap(~theme, ncol=1)

# Q6 — Pieces vs price ---------------------------------------
lego_complete_price <- lego |>
  filter(!is.na(pieces), !is.na(usd_msrp))

ggplot(lego_complete_price, aes(x = pieces, y = usd_msrp)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", se = TRUE) +
  labs(title = "Pieces vs. Price",
       x = "Pieces", y = "Price (USD)")

cor(lego_complete_price$pieces, lego_complete_price$usd_msrp)

# Q7 — Trends over time --------------------------------------
yearly <- lego |> 
  filter(!is.na(year), !is.na(ppp)) |>
  group_by(year) |>
  summarise(
    avg_pieces = mean(pieces, na.rm = TRUE),
    avg_price  = mean(usd_msrp, na.rm = TRUE),
    avg_ppp    = mean(ppp, na.rm = TRUE),
    med_ppp    = median(ppp, na.rm = TRUE),
    sets       = n(),
  ) 

ggplot(yearly, aes(x = year, y = avg_pieces)) +
  geom_line() + geom_point() +
  labs(title = "Average Pieces by Year",
       x = "Year", y = "Average pieces")

ggplot(yearly, aes(x = year, y = avg_price)) +
  geom_line() +
  labs(title = "Average Price by Year",
       x = "Year", y = "Average USD")

ggplot(yearly, aes(x = year, y = avg_ppp)) +
  geom_line() + 
  labs(title = "Average Price per Piece (PPP) by Year",
       x = "Year", y = "Average USD per piece")

ggplot(yearly, aes(x = year, y = med_ppp)) +
  geom_line() + 
  labs(title = "Median Price per Piece (PPP) by Year",
       x = "Year", y = "Average USD per piece")

### Seems totally contrary to LEGO enthusiests beliefs, lets only look at themed sets: 
yearly <- lego |> 
  filter(theme %in% c("Star Wars", "Harry Potter", 'Disney')) |>
  group_by(year, theme) |>
  summarise(
    avg_pieces = mean(pieces, na.rm = TRUE),
    avg_price  = mean(usd_msrp, na.rm = TRUE),
    avg_ppp    = mean(ppp, na.rm = TRUE),
    sets       = n(),
  ) |>
  filter(!is.na(yearly))

ggplot(yearly, aes(x = year, y = avg_pieces, col=theme)) +
  geom_line() + geom_point() +
  labs(title = "Average Pieces by Year",
       x = "Year", y = "Average pieces")

ggplot(yearly, aes(x = year, y = avg_price, col=theme)) +
  geom_line() + geom_point() +
  labs(title = "Average Price by Year",
       x = "Year", y = "Average USD")

ggplot(yearly, aes(x = year, y = avg_ppp, col=theme)) +
  geom_line() + geom_point() +
  labs(title = "Average Price per Piece (PPP) by Year",
       x = "Year", y = "Average USD per piece")

lego %>% filter(!is.na(usd_msrp), !is.na(year)) %>%  
  ggplot(aes(x=year, y=usd_msrp)) + geom_point(alpha=0.3) 

lego %>% filter(!is.na(usd_msrp))  %>% 
  group_by(year) %>% summarize(max_price = max(usd_msrp)) %>% 
  ggplot(aes(x=year,y=max_price)) + geom_line()

lego %>% filter(!is.na(usd_msrp))  %>% 
  group_by(year) %>% summarize(med_price = median(usd_msrp)) %>% 
  ggplot(aes(x=year,y=med_price)) + geom_line()







