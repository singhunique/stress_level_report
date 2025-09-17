# Load necessary packages
library(dplyr)
library(corrplot)
#set path
setwd("C:/Users/singh/OneDrive/Documents")
# 1.Data import 
# Import CSV
data <- read.csv("StressLevelDataset.csv", stringsAsFactors = FALSE)

# Preview the dataset
head(data)
str(data)
summary(data)

# 2. Data cleaning
# Count missing values per column
colSums(is.na(data))

# Percentage of missing values
colMeans(is.na(data)) * 100

# Check duplicates
sum(duplicated(data))


# Boxplot for stress level
boxplot(data$stress_level, main="Boxplot of Stress Levels")

# Boxplot for sleep quality
boxplot(data$sleep_quality, main="Boxplot of Sleep Quality")


# Convert categorical variables (if any) into factors
data$mental_health_history <- as.factor(data$mental_health_history)
data$bullying <- as.factor(data$bullying)
data$social_support <- as.factor(data$social_support)
