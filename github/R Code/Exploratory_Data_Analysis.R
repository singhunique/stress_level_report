# Histogram of stress levels
hist(data$stress_level, main="Distribution of Stress Levels", xlab="Stress Level")

# Predict probabilities from logistic model
pred <- predict(model_bully, type="response")

# Plot actual vs predicted
plot(data$bullying, pred,
     main="Probability of High Stress by Bullying",
     xlab="Bullying", ylab="Predicted Probability of High Stress",
     col="blue", pch=19)

# Scatterplot with regression line
plot(data$sleep_quality, data$stress_level,
     main="Sleep Quality vs Stress Level",
     xlab="Sleep Quality", ylab="Stress Level",
     pch=19, col="lightblue")

abline(lm(stress_level ~ sleep_quality, data=data), col="red", lwd=2)

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