############################################################
# Exploring Unicorn Companies — R Solution Script
# Data file: /mnt/data/unicorn.csv
############################################################

# ------------------------------
# Setup: packages + data
# ------------------------------
library(tidyverse)
library(scales)

uni <- read.csv("unicorn.csv")

# Quick look
glimpse(uni)


############################################################
# Q1) Visualize and describe the distribution of valuations
############################################################

# Histogram
uni %>%
  ggplot(aes(x = Valuation)) +
  geom_histogram(bins = 30) +
  labs(
    title = "Distribution of Unicorn Valuations",
    x = "Valuation (Billions of USD)",
    y = "Number of Companies"
  ) +
  theme_classic()

############################################################
# Q2) Which five countries have the largest number of unicorns?
############################################################

top_countries <- uni %>%
  group_by(Country) %>% 
  summarize(counts=n()) %>% 
  arrange(desc(counts))

head(top_countries, 5)

############################################################
# Q3) Do the top five countries differ in valuations on average?
#     Use side-by-side boxplots.
############################################################

# Filter the dataset to only include the top 5 countries
uni_top_countries <- uni %>%
  filter(Country %in% top_countries$Country)

# Side-by-side boxplots of valuations by country
ggplot(uni_top_countries, aes(x = Country, y = Valuation, fill = Country)) +
  geom_boxplot() +
  labs(
    title = "Unicorn Valuations in the Top 5 Countries",
    x = "Country",
    y = "Valuation (Billions of USD)"
  ) +
  theme_classic() +
  theme(
    axis.text.x = element_text(angle = 30, hjust = 1),
    legend.position = "none"
  )

# Numerical summaries (mean and median) by country
uni_top_countries %>%
  group_by(Country) %>%
  summarise(
    n = n(),
    mean_valuation = mean(Valuation, na.rm = TRUE),
    median_valuation = median(Valuation, na.rm = TRUE)
  ) %>%
  arrange(desc(mean_valuation))


############################################################
# Q4) Which five industries have the most unicorns?
############################################################
top_industries <- uni %>%
  count(Industry, sort = TRUE) %>%
  slice_head(n = 5)

top_industries

############################################################
# Q5) Do the top five industries differ in valuations on average?
#     Use side-by-side boxplots.
############################################################

# Filter the dataset to only include the top 5 industries
uni_top_industries <- uni %>%
  filter(Industry %in% top_industries$Industry)

# Side-by-side boxplots of valuations by industry
ggplot(uni_top_industries, aes(x = Industry, y = Valuation, fill = Industry)) +
  geom_boxplot() +
  labs(
    title = "Unicorn Valuations in the Top 5 Industries",
    x = "Industry",
    y = "Valuation (Billions of USD)"
  ) +
  theme_classic() +
  theme(
    axis.text.x = element_text(angle = 35, hjust = 1),
    legend.position = "none"
  )

# Numerical summaries (mean and median) by industry
uni_top_industries %>%
  group_by(Industry) %>%
  summarise(
    n = n(),
    mean_valuation = mean(Valuation, na.rm = TRUE),
    median_valuation = median(Valuation, na.rm = TRUE)
  ) %>%
  arrange(desc(mean_valuation))


############################################################
# Q6) Which 5 companies have the highest valuations?
############################################################
uni %>%
  arrange(desc(Valuation)) %>%
  select(Company, Valuation, Country, Industry, City) %>%
  slice_head(n = 10)



############################################################
# Q7) Has the number of unicorn companies changed over time?
#     (Using Founded_year)  — Barnhart-style
############################################################
uni %>%
  filter(!is.na(Founded_year)) %>%
  ggplot(aes(x = Founded_year)) +
  geom_bar() +
  labs(
    title = "Number of Unicorn Companies by Founded Year",
    x = "Founded Year",
    y = "Number of Companies"
  ) +
  theme_classic()

############################################################
# Q8) Reflection question
# No code needed (written response).
############################################################
