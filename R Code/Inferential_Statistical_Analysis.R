# 4.Inferential statistical analysis
# stress vs sleep Quality 
model <- lm(stress_level ~ sleep_quality, data = data)
summary(model)

# stress vs Bullying 
# Create binary variable for high stress
data$high_stress <- ifelse(data$stress_level >= 4, 1, 0)

# Logistic regression
model_bully <- glm(high_stress ~ bullying, data=data, family=binomial)
summary(model_bully)

# Correlation between stress and academic performance
cor.test(data$stress_level, data$academic_performance)

# Fit model
model_sleep <- lm(stress_level ~ sleep_quality, data=data)



# Predict probabilities from logistic model
pred <- predict(model_bully, type="response")

# Plot actual vs predicted
plot(data$bullying, pred,
     main="Probability of High Stress by Bullying",
     xlab="Bullying", ylab="Predicted Probability of High Stress",
     col="blue", pch=19)

abline(lm(stress_level ~ sleep_quality, data=data), col="red", lwd=2)

# Diagnostic plots (4-in-1)
par(mfrow=c(2,2))
plot(model_sleep)
par(mfrow = c(1, 1))

