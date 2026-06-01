#Mini project 4: probability distribution and MLE
library(tidyverse)

#We will use the waiting times from the faithful dataset
#faithful is the records of eruptions of the Old Faithful geyser
data("faithful")
str(faithful)
summary(faithful$waiting)

#visualising the distribution
ggplot(faithful, aes(x = waiting)) +
  geom_histogram(binwidth = 3, fill = "steelblue", color = "white") +
  labs(title = "Distribution of waiting times",
       x = "Waiting time (minutes)",
       y = "Count")+
  theme_minimal()

#Bimodal distribution, two distinct peaks around 55 and 80 minutes
#mean of 70.9 falls in the valley, not representative of either group
#cannot assume normality, visual inspection is essential before modelling

# Split into two groups based on the valley at ~67 minutes
short_wait <- faithful$waiting[faithful$waiting < 67]
long_wait <- faithful$waiting[faithful$waiting >= 67]

# Check normality visually with a QQ plot for each group
qqnorm(short_wait, main = "QQ plot — short waiting times")
qqline(short_wait, col = "red")

qqnorm(long_wait, main = "QQ plot — long waiting times")
qqline(long_wait, col = "red")

# Each group is approximately normal when separated
# Bimodal distribution = two overlapping normal distributions
# This is called a Gaussian mixture model in statistics/ML

# Estimate mean and sd for each group using MLE
# For a normal distribution, MLE estimates are simply mean and sd
mean(short_wait); sd(short_wait)
mean(long_wait); sd(long_wait)

# Visualise normal fit for each group
par(mfrow = c(1, 2))

hist(short_wait, probability = TRUE, main = "Short waits",
     xlab = "Waiting time (minutes)", col = "steelblue", border = "white")
curve(dnorm(x, mean = mean(short_wait), sd = sd(short_wait)),
      add = TRUE, col = "red", lwd = 2)

hist(long_wait, probability = TRUE, main = "Long waits",
     xlab = "Waiting time (minutes)", col = "steelblue", border = "white")
curve(dnorm(x, mean = mean(long_wait), sd = sd(long_wait)),
      add = TRUE, col = "red", lwd = 2)

# MLE estimates: short waits ~ N(54.6, 5.79), long waits ~ N(80.2, 5.70)
# Both groups approximately normal with similar spread but different means
# Normal curve fits long waits better — larger sample size produces smoother histogram
# Key insight: always visualise before assuming normality