#mini project 5: confidence intervals
library(tidyverse)

#We'll use the mtcars dataset again. Estimating the true mean MPG
#with a confidence interval

n <- nrow(mtcars)
x_bar <- mean(mtcars$mpg)
s <- sd(mtcars$mpg)

n; x_bar; s

#since we are working with a sample we use t-distribution
#build a 95% confidence interval manually
alpha <- 0.05
t_critical <- qt(1 - alpha/2, df = n - 1)

#we also need the margin of error

margin_of_error <- t_critical * (s / sqrt(n))

#now we compute upper and lower
ci_lower <- x_bar - margin_of_error
ci_upper <- x_bar + margin_of_error

cat("95% Confidence Interval:", round(ci_lower, 2), "to", round(ci_upper, 2))

#verify using R built in t.test

t.test(mtcars$mpg, conf.level = 0.95)

# Visualise the confidence interval
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth = 2, fill = "steelblue", color = "white") +
  geom_vline(xintercept = x_bar, col = "red", lwd = 1) +
  geom_vline(xintercept = ci_lower, col = "darkgreen", lwd = 1, linetype = "dashed") +
  geom_vline(xintercept = ci_upper, col = "darkgreen", lwd = 1, linetype = "dashed") +
  labs(title = "MPG distribution with 95% confidence interval",
       x = "Miles per gallon",
       y = "Count",
       caption = "Red = sample mean | Green dashed = 95% CI bounds") +
  theme_minimal()

# 95% CI: (17.92, 22.26) — calculated manually and verified with t.test()
# t-distribution used: small sample (n=32), population sd unknown
# Histogram shows slight right skew — t-distribution accounts for this uncertainty
# Red line = sample mean (20.09), green dashed lines = CI bounds

