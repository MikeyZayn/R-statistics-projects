# Mini project 3: statistical analysis with iris
library(tidyverse)

# Load and inspect the dataset
data(iris)
str(iris)
summary(iris)

#Descriptive statistics by species
iris %>%
  group_by(Species) %>%
  summarise(
    mean_petal_length = mean(Petal.Length),
    sd_petal_length = sd(Petal.Length),
    var_petal_length = var(Petal.Length)
  )

# ANOVA: does petal length differ significantly across species?
anova_result <- aov(Petal.Length ~ Species, data = iris)
summary(anova_result)

# F value = 1180, p < 2e-16: extremely significant result
# We reject the null hypothesis — petal length differs significantly across species
# The large F value tells us between-group variance vastly exceeds within-group variance

# Visualise petal length distribution by species
ggplot(iris, aes(x = Species, y = Petal.Length, fill = Species)) +
  geom_boxplot() +
  labs(title = "Petal length distribution by species",
       x = "Species",
       y = "Petal length (cm)") +
  theme_minimal() +
  theme(legend.position = "none")

# Boxplot confirms ANOVA — three species occupy completely separate ranges
# No overlap between setosa and the others — visually confirms significant difference