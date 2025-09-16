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
