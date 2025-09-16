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

# Diagnostic plots (4-in-1)
par(mfrow=c(2,2))
plot(model_sleep)
