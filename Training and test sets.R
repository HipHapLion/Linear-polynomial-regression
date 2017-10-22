dat <- read.csv("dat2.csv")
indices <- c(605, 3, 321)
dat[indices,]
dat[-indices,]
sample(10, 4)
sample(20, 11)
indices <- sample(1000, 500)
train <- dat[indices,]
test <- dat[-indices,]

ggplot() + geom_point(data = train, aes(x, y)) + ggtitle("TRAINING SET")
ggplot() + geom_point(data = test, aes(x, y)) + ggtitle("TEST SET")

# ----- #
train <- read.csv("Train.csv")
test <- read.csv("Test.csv")

model <- lm(y~x, data = train)
x <- 4
x <- c(1, 9)
y <- predict(model, data.frame(x))
endpoints <- data.frame(x, y)

x <- test$x
predict(model, data.frame(x))
predict(model, test)

sum((test$y - predict(model, test))^2)
mse_test <- mean((test$y - predict(model, test))^2)

model <- lm(y~x+I(x^2), data = train)

f <- function(x){
  return(predict(model, data.frame(x)))
}

ggplot() + geom_point(data = train, aes(x, y)) + ggtitle("TRAINING SET") +
  geom_line(data = endpoints, aes(x, y), color = "red") +
  stat_function(data = data.frame(x = c(1, 9)), aes(x), fun = f, color = "blue", size = 1)

ggplot() + geom_point(data = test, aes(x, y)) + ggtitle("TEST SET") +
  geom_line(data = endpoints, aes(x, y), color = "red") +
  stat_function(data = data.frame(x = c(1, 9)), aes(x), fun = f, color = "blue", size = 1)

mean((test$y - predict(model, test))^2)

# ---- #
lm(y~x+I(x^2)+I(x^3), data = train)
lm(y~poly(x, 3, raw = TRUE), data = train)

mse <- numeric()

for(i in 1:10){
  model <- lm(y~poly(x, i, raw = TRUE), data = train)
  mse[i] <- mean((test$y - predict(model, test))^2)
}

x <- 1:10
y <- mse
mse_poly <- data.frame(x, y)

ggplot() + geom_point(data = mse_poly, aes(x, y), size = 2) +
  geom_line(data = mse_poly, aes(x, y)) +
  xlab("Polynomial degree") +
  ylab("TEST MSE") +
  geom_point(data = poly2, aes(x, y), color = "forestgreen") +
  geom_line(data = poly2, aes(x, y), color = "forestgreen") +
  geom_point(data = poly3, aes(x, y), color = "red") +
  geom_line(data = poly3, aes(x, y), color = "red")

# ----------- #

mse_calc <- function(train, test){
  mse <- numeric()
  for(i in 1:10){
    model <- lm(y~poly(x, i, raw = TRUE), data = train)
    mse[i] <- mean((test$y - predict(model, test))^2)
  }
  return(mse)
}

x <- 1:10
plot <- ggplot() + ylim(80, 200)
for(i in 1:10){
  indices <- sample(1000, 500)
  train <- dat[indices,]
  test <- dat[-indices,]
  y <- mse_calc(train, test)
  mse_poly <- data.frame(x, y)
  plot <- plot + geom_point(data = mse_poly, aes(x, y), size = 1) +
    geom_line(data = mse_poly, aes(x, y))
}
plot











