############################################################
# Intro to R: Heart Disease (CDC BRFSS)
# Two-variable categorical data: bar charts & relative bars
# Dataset: heart.csv
# Expected columns (at least):
#   HeartDisease, AgeCategory, GenHealth, Smoking, SleepTime,
#   Diabetic, PhysicalActivity, Asthma, KidneyDisease, Gender, Race
############################################################

# ---- Setup ----
library(readr)
library(dplyr)
library(ggplot2)

# for percent axis labels (used with scale_y_continuous)
library(scales)

# ---- Load Data ----
# Make sure "heart.csv" is in your working directory, or change the path.
heart <- read_csv("heart.csv", show_col_types = FALSE)

# Quick checks
names(heart)
dim(heart)
glimpse(heart)


############################################################
# Q1. Overall Heart Disease Prevalence
############################################################

# Bar chart of HeartDisease counts
heart %>%
  ggplot(aes(x = HeartDisease)) +
  geom_bar() +
  labs(
    title = "Counts of Heart Disease in the Sample",
    x = "Heart Disease Status",
    y = "Number of Adults"
  ) +
  theme_classic()


# Table of counts and estimated probability
table(heart$HeartDisease)

# Estimated probability that a randomly chosen adult has heart disease
# (assumes level "Yes" is present; adjust if your data uses 1/0 or TRUE/FALSE)
table(heart$HeartDisease)/length(heart$HeartDisease)

# Conditional probability given AgeCategory = "18-24"
# (change "18-24" to match your actual level if needed)
heart %>%
  filter(AgeCategory == "18-24") %>% 
  select(HeartDisease) %>% 
  table()

table(heart$HeartDisease,heart$AgeCategory) # Second Way to Do it 


############################################################
# Q2. Heart Disease vs General Health (Counts)
############################################################

heart %>% 
  ggplot(aes(x = GenHealth, fill = HeartDisease)) +
  geom_bar(position='dodge') +
  labs(
    title = "Heart Disease Counts by General Health",
    x = "General Health",
    y = "Count of Adults",
    fill = "Heart Disease"
  ) +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# note the difference between 'stack', 'dodged, and 'fill' 

############################################################
# Q3. Heart Disease vs General Health (Relative Bar)
############################################################

p_q3 <- heart %>%
  ggplot(aes(x = GenHealth, fill = HeartDisease)) +
  geom_bar(position = "fill") +
  labs(
    title = "Proportion with Heart Disease by General Health",
    x = "General Health",
    y = "Proportion (within each health category)",
    fill = "Heart Disease"
  ) +
  scale_y_continuous(labels = percent_format()) +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

print(p_q3)


############################################################
# Q4. Heart Disease vs Age Category (Relative Bar)
############################################################

p_q4 <- heart %>%
  ggplot(aes(x = AgeCategory, fill = HeartDisease)) +
  geom_bar(position = "fill") +
  labs(
    title = "Proportion with Heart Disease by Age Category",
    x = "Age Category",
    y = "Proportion (within age group)",
    fill = "Heart Disease"
  ) +
  scale_y_continuous(labels = percent_format()) +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

print(p_q4)


############################################################
# Q5. Heart Disease vs Smoking (Relative Bar)
############################################################

p_q5 <- heart %>%
  ggplot(aes(x = Smoking, fill = HeartDisease)) +
  geom_bar(position = "fill") +
  labs(
    title = "Proportion with Heart Disease by Smoking Status",
    x = "Smoking (100+ cigarettes in life)",
    y = "Proportion (within smoking group)",
    fill = "Heart Disease"
  ) +
  scale_y_continuous(labels = percent_format()) +
  theme_classic()

print(p_q5)


############################################################
# Q6. Distribution of Sleep Time
############################################################

p_q6 <- heart %>%
  ggplot(aes(x = SleepTime)) +
  geom_histogram(bins = 30, color = "white") +
  labs(
    title = "Distribution of Sleep Time",
    x = "Hours of Sleep in 24 Hours",
    y = "Number of Adults"
  ) +
  theme_classic()

print(p_q6)


############################################################
# Q7. Heart Disease vs Sleep (Trimmed)
############################################################

# Filter to 2–15 hours
heart_trim <- heart %>%
  filter(SleepTime >= 2, SleepTime <= 15)

# Option A: Treat SleepTime as discrete numeric x-axis
p_q7a <- heart_trim %>%
  ggplot(aes(x = as.factor(SleepTime), fill = HeartDisease)) +
  geom_bar(position = "fill") +
  labs(
    title = "Proportion with Heart Disease by Sleep Time (2–15 hrs)",
    x = "Sleep Time (hours)",
    y = "Proportion (within each sleep hour)",
    fill = "Heart Disease"
  ) +
  scale_y_continuous(labels = percent_format()) +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))

print(p_q7a)

# Option B: Create sleep categories (Low / Normal / High)
heart_trim <- heart_trim %>%
  mutate(
    SleepCategory = case_when(
      SleepTime < 6 ~ "Low",
      SleepTime <= 9 ~ "Normal",
      TRUE ~ "High"
    )
  )

p_q7b <- heart_trim %>%
  ggplot(aes(x = SleepCategory, fill = HeartDisease)) +
  geom_bar(position = "fill") +
  labs(
    title = "Proportion with Heart Disease by Sleep Category",
    x = "Sleep Category",
    y = "Proportion (within sleep category)",
    fill = "Heart Disease"
  ) +
  scale_y_continuous(labels = percent_format()) +
  theme_classic()

print(p_q7b)


############################################################
# Q8. Explore One More Variable (Example: Diabetic)
############################################################

# You can swap Diabetic for any other categorical variable:
# e.g., "PhysicalActivity", "Asthma", "KidneyDisease", "Gender", "Race", etc.
p_q8 <- heart %>% 
  ggplot(aes(x = Diabetic, fill = HeartDisease)) +
  geom_bar(position = "fill") +
  labs(
    title = "Proportion with Heart Disease by Diabetic Status",
    x = "Diabetic Status",
    y = "Proportion (within diabetic group)",
    fill = "Heart Disease"
  ) +
  scale_y_continuous(labels = percent_format()) +
  theme_classic()

print(p_q8)

############################################################
# End of script
############################################################
