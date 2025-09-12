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


# Check structure again
str(data)
summary(data)
names(data)
# Histogram of stress levels
hist(data$stress_level, main="Distribution of Stress Levels", xlab="Stress Level")

# Boxplot: stress by bullying 
boxplot(stress_level ~ bullying, data=data, main="Stress Levels by Bullying")

# Boxplot: stress by sleep quality
boxplot(stress_level ~ sleep_quality, data=data, main="Stress vs Sleep Quality")

# Scatterplot: stress vs academic performance
plot(data$academic_performance, data$stress_level,
     xlab="Academic Performance", ylab="Stress Level",
     main="Stress vs Academic Performance")

# Correlation matrix (numeric variables)
numeric_data <- data[sapply(data, is.numeric)]
corr_matrix <- cor(numeric_data, use="complete.obs")
corrplot(corr_matrix, method="color", tl.cex=0.7)



model <- lm(stress_level ~ sleep_quality, data = data)
summary(model)


















