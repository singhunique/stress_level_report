# 3. EDA
# Summary of numeric variables
summary(data[, c("stress_level", "sleep_quality", "academic_performance")])
# Frequency of categories
table(data$bullying)
table(data$family_issues)


# Histogram of stress levels
hist(data$stress_level, main="Distribution of Stress Levels", xlab="Stress Level")


# Scatterplot with regression line
plot(data$sleep_quality, data$stress_level,
     main="Sleep Quality vs Stress Level",
     xlab="Sleep Quality", ylab="Stress Level",
     pch=19, col="lightblue")



library(corrplot)

# Select numeric variables
num_data <- data[, c("stress_level", "sleep_quality", "academic_performance")]

# Correlation matrix
cor_matrix <- cor(num_data)

# Heatmap
corrplot(cor_matrix, method="color", addCoef.col="black", number.cex=0.8)

# Correlation matrix (numeric variables)
numeric_data <- data[sapply(data, is.numeric)]
corr_matrix <- cor(numeric_data, use="complete.obs")
corrplot(corr_matrix, method="color", tl.cex=0.7)
