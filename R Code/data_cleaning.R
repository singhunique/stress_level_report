# Load necessary packages
library(dplyr)
library(corrplot)
#set path
setwd("C:/Users/singh/OneDrive/Documents")
# Import CSV
data <- read.csv("StressLevelDataset.csv", stringsAsFactors = FALSE)

# Preview the dataset
head(data)
str(data)
summary(data)

# Count missing values per column
colSums(is.na(data))

# Percentage of missing values
colMeans(is.na(data)) * 100

# Boxplot for stress_level
boxplot(data$stress_level, main = "Stress Level Outliers")

# Boxplots for all numeric variables
boxplot(data, las=2, main="Boxplots for Numeric Variables")

# Convert categorical variables (if any) into factors
data$mental_health_history <- as.factor(data$mental_health_history)
data$bullying <- as.factor(data$bullying)
data$social_support <- as.factor(data$social_support)