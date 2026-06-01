# Mini project 7: simple linear regression
library(tidyverse)

# We'll use mtcars again — predicting MPG from weight
# We already know they're correlated (project 1) — now we model it formally

model <- lm(mpg ~ wt, data = mtcars)
summary(model)

# slope = -5.34: each additional 1000 lbs reduces MPG by 5.34 miles
# intercept = 37.29: predicted MPG at zero weight — mathematically necessary, not meaningful
# R-squared = 0.75: weight explains 75% of the variation in MPG

# Plot the regression line
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(col = "steelblue", size = 3) +
  geom_smooth(method = "lm", col = "red", se = TRUE) +
  labs(title = "Simple linear regression: weight vs MPG",
       x = "Weight (1000 lbs)",
       y = "Miles per gallon") +
  theme_minimal()

# Check residuals
model_residuals <- model$residuals

# Plot residuals
ggplot(data.frame(model_residuals), aes(x = model_residuals)) +
  geom_histogram(binwidth = 1, fill = "steelblue", color = "white") +
  labs(title = "Distribution of residuals",
       x = "Residuals",
       y = "Count") +
  theme_minimal()

# QQ plot of residuals
qqnorm(model_residuals, main = "QQ plot of residuals")
qqline(model_residuals, col = "red")

# Residuals approximately normally distributed — linear regression assumptions satisfied
# Model is valid: weight is a significant predictor of MPG (p < 0.001)
# Full equation: MPG = 37.29 - 5.34 * weight

