#mini project 6: hypothesis testing
library(tidyverse)

#We will use the sleep dataset
#it records extra hours of sleep gained by patients on two different drugs

data(sleep)
str(sleep)
summary(sleep)

print(sleep)

# Visualise extra sleep by group
ggplot(sleep, aes(x = group, y = extra, fill = group)) +
  geom_boxplot() +
  labs(title = "Extra sleep gained by drug group",
       x = "Drug group",
       y = "Extra sleep (hours)") +
  theme_minimal() +
  theme(legend.position = "none")

#Null hypothesis: there is no difference in sleep gained between the two drugs
#Alternative hypothesis: there is a difference in sleep gained between the two drugs

# Paired t-test — same patients measured twice
t_result <- t.test(extra ~ group, data = sleep, paired = TRUE)
t_result

# Split into two groups then run paired t-test
group1 <- sleep$extra[sleep$group == 1]
group2 <- sleep$extra[sleep$group == 2]

t_result <- t.test(group1, group2, paired = TRUE)
t_result

# Null: no difference in sleep between drug groups
# Alternative: there is a difference
# p-value = 0.0028 < 0.05 — reject the null hypothesis
# 95% CI: (-2.46, -0.70) — zero not contained, confirms rejection
# Drug 2 produces on average 1.58 more hours of sleep than drug 1