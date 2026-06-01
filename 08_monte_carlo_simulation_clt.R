# Mini project 8: Monte Carlo simulation and the Central Limit Theorem
library(tidyverse)

# The CLT states that the distribution of sample means approaches
# a normal distribution as sample size increases — regardless of the
# underlying population distribution

# We'll prove this empirically using simulation

# Start with a heavily skewed population — exponential distribution
set.seed(42)
population <- rexp(100000, rate = 0.2)

# Visualise the population
ggplot(data.frame(population), aes(x = population)) +
  geom_histogram(bins = 100, fill = "steelblue", color = "white") +
  labs(title = "Population distribution (exponential)",
       x = "Value", y = "Count") +
  theme_minimal()

# Simulate sample means for different sample sizes
sample_sizes <- c(1, 5, 30, 100)
n_simulations <- 1000

# Create empty dataframe to store results
results <- data.frame()

for (n in sample_sizes) {
  sample_means <- replicate(n_simulations, mean(sample(population, n)))
  temp <- data.frame(mean = sample_means, sample_size = as.factor(n))
  results <- rbind(results, temp)
}

# Visualise how distribution of sample means changes with sample size
ggplot(results, aes(x = mean, fill = sample_size)) +
  geom_histogram(bins = 50, color = "white") +
  facet_wrap(~ sample_size, scales = "free",
             labeller = label_both) +
  labs(title = "CLT demonstration — sample means by sample size",
       x = "Sample mean", y = "Count") +
  theme_minimal() +
  theme(legend.position = "none")

# Population is heavily right skewed (exponential)
# n=1: no normality — just reflects the skewed population
# n=5: slight improvement, still skewed
# n=30: approximately normal — CLT threshold confirmed empirically
# n=100: near perfect normal distribution
# Key insight: CLT holds regardless of population shape — sample size is what matters

#Checking skewness of each group

library(moments)

results %>%
  group_by(sample_size) %>%
  summarise(skewness = round(skewness(mean), 3))

# Skewness converges to zero as sample size increases
# Numerically confirms what the histograms showed visually
# CLT proven both visually and quantitatively