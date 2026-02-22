# ============================================================
#  Pokémon Data Science Tutorial - Group Activity
#  Dataset: "The Complete Pokémon Dataset" (Rounak Banik, Kaggle)
#  Goal: Explore Pokémon statistics using simple R summaries & plots
# ============================================================

# --- Libraries ---
library(readr)
library(dplyr)
library(ggplot2)
library(janitor)

# --- Load and clean dataset ---
pk <- read_csv("pokemon.csv")   # make sure this file is in your working directory
pk <- clean_names(pk)           # cleans column names (e.g., "Sp. Atk" -> "sp_atk")

# --- Preview the data ---
glimpse(pk)
summary(pk)



# ============================================================
# Q1. Summarize the Dataset
# Description: How many observations (rows)? How many variables (columns)?
# What are the basic characteristics of the data?
# ============================================================

dim(pk)              # rows and columns
names(pk)            # variable names


# --- Create a total stat variable (sum of base stats) ---
pk <- pk %>%
  mutate(total = hp + attack + defense + sp_attack + sp_defense + speed)

# Simple summary statistics
pk %>%
  summarise(
    n_pokemon = n(),
    n_variables = ncol(pk),
    mean_total = mean(total, na.rm = TRUE),
    median_total = median(total, na.rm = TRUE)
  )

# Average total stats by Generation
pk %>%
  group_by(generation) %>%
  summarise(avg_total = mean(total, na.rm = TRUE))



# ============================================================
# Q2. What does it mean for a Pokémon to be “strong”?
# Description: We'll define "strength" as the total of all base stats.
# Find the strongest Pokémon overall.
# ============================================================

# Top 10 Pokémon by total stats
pk %>%
  arrange(desc(total)) %>%
  select(name, type1, type2, total) %>%
  head(10)

# Simple histogram of total strength
ggplot(pk, aes(x = total)) +
  geom_histogram(bins = 25, fill = "skyblue", color = "white") +
  labs(title = "Distribution of Total Pokémon Strength", x = "Total Base Stats", y = "Count")



# ============================================================
# Q3. How do different Pokémon types vary in their attributes?
# Description: Compare average strength across primary types.
# ============================================================

# Average total stats by primary type
pk %>%
  group_by(type1) %>%
  summarise(avg_total = mean(total, na.rm = TRUE)) %>%
  arrange(desc(avg_total))

# Boxplot comparing types
ggplot(pk, aes(x = type1, y = total)) +
  geom_boxplot(fill = "lightgreen") +
  coord_flip() +
  labs(title = "Total Stats by Primary Type", x = "Type", y = "Total Stats")



# ============================================================
# Q4. Are Legendary Pokémon stronger than non-Legendaries?
# Description: Compare total stats distributions for Legendary vs. regular Pokémon.
# ============================================================

# Summary table
pk %>%
  group_by(is_legendary) %>%
  summarise(avg_total = mean(total, na.rm = TRUE),
            count = n())

# Simple boxplot THIS PLOT IS BROKEN BECAUSE 'is_legendary' is a numeric variable (see below how 'factor')
# ggplot(pk, aes(x = is_legendary, y = total, fill = is_legendary)) +
#  geom_boxplot() +
#  labs(title = "Legendary vs Non-Legendary Pokémon", x = "Legendary?", y = "Total Stats") +
#  scale_fill_manual(values = c("skyblue", "orange"))


# Make a labeled factor once
pk <- pk %>%
  mutate(is_legendary_factored = factor(is_legendary,
                               levels = c(0, 1),
                               labels = c("No", "Yes")))

# Now the plot works and is nicely labeled
ggplot(pk, aes(x = is_legendary_factored, y = total, fill = is_legendary_factored)) +
  geom_boxplot() +
  labs(title = "Legendary vs Non-Legendary Pokémon",
       x = "Legendary?",
       y = "Total Stats") +
  scale_fill_manual(values = c("No" = "skyblue", "Yes" = "orange"))

# Faceted histograms (same bins so panels are comparable)
ggplot(pk, aes(x = total)) +
  geom_histogram(bins = 25, color = "white", fill = "skyblue") +
  facet_wrap(~ is_legendary_factored, ncol = 2) +
  labs(title = "Distribution of Total Base Stats",
       x = "Total (BST)",
       y = "Count")

# Faceted histograms (FRER Y since there are much less Legendary)
ggplot(pk, aes(x = total)) +
  geom_histogram(bins = 25, color = "white", fill = "skyblue") +
  facet_wrap(~ is_legendary_factored, ncol = 2, scales = "free_y") +
  labs(title = "Distribution of Total Base Stats",
       x = "Total (BST)",
       y = "Count")




# ============================================================
# Q5. Is there an association between a Pokémon’s weight and height?
# Description: Explore relationship between height and weight visually.
# ============================================================

ggplot(pk, aes(x = height_m, y = weight_kg)) +
  geom_point(alpha = 0.7, color = "darkblue") +
  labs(title = "Height vs Weight of Pokémon", x = "Height (m)", y = "Weight (kg)")

# Optional: Correlation (I'd like you to understand what correlation is by the end of the semester)
cor(pk$height_m, pk$weight_kg, use = "complete.obs")



# ============================================================
# Q6. Have newer generations of Pokémon become stronger or weaker?
# Description: Compare total strength across Generations.
# ============================================================

ggplot(pk, aes(x = factor(generation), y = total, fill = factor(generation))) +
  geom_boxplot() +
  labs(title = "Pokémon Strength Across Generations", x = "Generation", y = "Total Stats") +
  scale_fill_brewer(palette = "Set3")

pk %>%
  group_by(generation) %>%
  summarise(avg_total = mean(total, na.rm = TRUE),
            median_total = median(total, na.rm = TRUE))



# ============================================================
# END OF SCRIPT
# ============================================================
