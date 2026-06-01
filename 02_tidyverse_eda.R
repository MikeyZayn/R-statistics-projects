#mini project 2: tidyverse EDA with mtcars
library(tidyverse)

#converting cyl to a factor so R treats it as a category, not a number 
mtcars$cyl <- as.factor(mtcars$cyl)

#average mpg per cylinder group
mtcars %>%
  group_by(cyl) %>%
  summarise(avg_mpg = mean(mpg))

#which cars have above average MPG?
avg <- mean(mtcars$mpg)

mtcars %>%
  filter(mpg > avg) %>%
  select(mpg, cyl, hp, wt)

#visualising mpg distribution by cylinder group
ggplot(mtcars, aes(x = cyl, y = mpg, fill = cyl)) + geom_boxplot() +labs(title = "MPG distribution by cylinder group",
                                                                         x = "Number of cylinders",
                                                                         y = "Miles per gallon",) +
  theme_minimal() + theme(legend.position = "none")

#4cyl cars show higher variance in MPG than 6 or 8 cyl groups
#8cyl cars are consistently low efficency, they have a tight IQR around 15MPG

#avg horsepower per cylinder group
mtcars %>%
  group_by(cyl) %>%
  summarise(avg_hp = mean(hp))

#cars that have both above avg horsepower AND above avg MPG
avg <- mean(mtcars$hp)
avg2 <- mean(mtcars$mpg)

mtcars %>%
  filter(hp > avg, mpg > avg2) %>%
  select(mpg, cyl, hp, wt)

#ggplot scatterplot of weight vs MPG coloured by cylinder group
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) + 
  geom_point(size = 3) + labs(title = "Weight vs Fuel efficiency by cylinder group",
                              x = "Weight (1000 lbs)",
                              y = "Miles per gallon",) +
  theme_minimal()

# 4-cyl cars (red) show higher variance in both weight and MPG
# 8-cyl cars (blue) cluster tightly, heavy and consistently inefficient
# weight and cylinder count are directly proportional, bigger engine = heavier car
