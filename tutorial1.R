# Libraries
library(ggplot2)

x <- c(3,6,8)
y <- c(4,7,6)
s <- c(4,5,6)
X <- data.frame(x, y, s)

# ggplot tutorial
x <- 4
y <- -9
dat <- data.frame(x, y)

ggplot() + geom_point(data= dat, aes(x= x, y= y), size= 2, color= "blue")

ggplot(dat, aes(x, y)) + geom_point(size= 2)

x <- c(2, 5, 1)
y <- c(6, 4, 9)
dat <- data.frame(x,y)

ggplot() + geom_point(data= dat, aes(x= x, y= y), size= 3, color= "forestgreen", shape= 15) +
  scale_x_continuous(limits = c(0,15), breaks = seq(0, 15, 5)) +
  scale_y_continuous(limits = c(0,15), breaks = seq(0, 15, 5))

seq(0,15,10)

# Graph lines ggplot
x <- c(1, 8)
y <- c(3, 10)
dat <- data.frame(x, y)

ggplot(dat, aes(x, y)) + geom_line()

dat$x <- c(-2, 7)
dat$y <- c(13, -5)

x <- c(0, 10)
y <- 3*x+1
dat <- data.frame(x, y)

ggplot(dat, aes(x, y)) + geom_line()

y <- -5*x-7
y <- 0.5*x-0.73

# normal populations
sample(1:10, 100, replace = T)

rnorm(100, 50, 10)

x <- rep(1, 100)
y <- rnorm(100, 50, 10)
dat <- data.frame(x, y)

x <- 1
y <- 50
mean <- data.frame(x, y)

ggplot(dat, aes(x, y)) + geom_point(size=1) +
  geom_point(data= mean, aes(x, y), size = 7, color= "red")

x <- rep(1, 100)
x <- c(x, rep(9, 100))
x <- c(x, rep(15, 100))
y <- rnorm(100, 50, 10)
y <- c(y, rnorm(100, 30, 10))
y <- c(y, rnorm(100, 78, 10))
dat <- data.frame(x, y)

x <- c(1, 9, 15)
y <- c(50, 30, 78)
means <- data.frame(x, y)

ggplot(dat, aes(x, y)) + geom_point() +
  geom_point(data= means, aes(x, y), size= 7, color= "red")

x <- c(0, 25)
y <- 3 * x + 1
line <- data.frame(x, y)

x <- c(1, 9, 15, 22)
y <- 3 * x + 1  
means <- data.frame(x, y)  

ggplot(line, aes(x ,y)) + geom_line() +
  geom_point(data= means, aes(x, y), size= 7, color= "red")

x <- c(rep(1, 100), rep(9, 100), rep(15, 100), rep(22, 100))
y <- c(rnorm(100, 4, 10), rnorm(100, 28, 10), rnorm(100, 46, 10), rnorm(100, 67, 10))
dat <- data.frame(x, y)

ggplot(line, aes(x ,y)) + geom_line() +
  geom_point(data= means, aes(x, y), size= 7, color= "red") +
  geom_point(data= dat, aes(x, y))

x <- c(2, 4, 9, 15)

sqrt(x)

x^2

sapply(x, function(x) sqrt(x))

sapply(x, function(x) x^2)

sapply(x, function(x) rnorm(1, x, 10))

x <- rnorm(100, 10, 5)
y <- 3*x+1
means <- data.frame(x, y)

ggplot(means, aes(x, y)) + geom_point(color= "red")

x <- c(-5, 25)
y <- 3*x+1
line <- data.frame(x, y)

ggplot(means, aes(x, y)) + geom_point(color= "red") +
  geom_line(data= line, aes(x, y)) +
  scale_x_continuous(limits = c(-10, 30)) +
  scale_y_continuous(limits = c(-20, 80))

x <- means$x
y <- sapply(x, function(x) rnorm(1, 3*x+1, 10))
dat <- data.frame(x, y)

ggplot(means, aes(x, y)) + geom_point(color= "red") +
  geom_line(data= line, aes(x, y)) +
  scale_x_continuous(limits = c(-10, 30)) +
  scale_y_continuous(limits = c(-20, 80)) +
  geom_point(data= dat, aes(x, y))

# ----- #

ggplot(father.son, aes(fheight, sheight)) + geom_point(size= 0.5)

x <- c(60, 75)
y <- c(63, 78)
line <- data.frame(x, y)

ggplot(father.son, aes(fheight, sheight)) + geom_point(size= 0.5) +
  geom_line(data= line, aes(x, y))

x <- father.son$fheight
y <- father.son$sheight
group <- 1:1078
dat <- data.frame(x, y, group)

y <- x+3
means <- data.frame(x, y, group)

head(dat)
head(means)

x <- c(50, 80)
y <- x+3
line <- data.frame(x, y)
d <- rbind(dat, means)

ggplot(dat, aes(x, y)) + geom_point() +
  geom_point(data= means, aes(x, y), color= "red") +
  geom_line(data= line, aes(x, y)) +
  geom_line(data= d, aes(x, y, group= group)) 

sum((means$y-dat$y)^2) # residual sum of squares (looking for minimum aka least squares line)

X <- lm(y~x, data= dat)
slope <- X$coefficients[["x"]]
intercept <- X$coefficients[["(Intercept)"]]
x <- c(57, 78)
y <- slope*x+intercept
line <- data.frame(x, y)

x <- means$x
y <- slope*x+intercept
means <- data.frame(x, y, group)
d <- rbind(dat, means)

ggplot(dat, aes(x, y)) + geom_point() +
  geom_point(data= means, aes(x, y), color= "red") +
  geom_line(data= line, aes(x, y)) +
  geom_line(data= d, aes(x, y, group= group))

# ------- #
ggplot(line, aes(x, y)) + geom_line()

slope*70+intercept

