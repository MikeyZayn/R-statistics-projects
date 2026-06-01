str(mtcars)
head(mtcars)
summary(mtcars)
mean(mtcars$gear)
sum(mtcars$cyl > 6)
mtcars[which.max(mtcars$mpg), ]
plot(mtcars$wt, mtcars$mpg,
     main = "Weight vs Fuel efficiency",
     xlab = "Weight (1000 lbs)",
     ylab = "Miles per gallon",
     pch = 19, col = "steelblue")

abline(lm(mpg ~ wt, data = mtcars), col = "red")

cor(mtcars$hp, mtcars$mpg)
