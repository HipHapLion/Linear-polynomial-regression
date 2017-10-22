

x <- c(0, 10)
axis <- data.frame(x)

ggplot(data.frame(x= c(-5, 5)), aes(x)) + stat_function(fun = f2)  
# ------ #
dat <- read.csv("dat.csv")

# dat <- data.frame(x= dat2$x, y= dat2$y)
# write.csv(x = dat, file = "dat.csv", row.names = F)

ggplot(dat, aes(x, y)) + geom_point()

lm(y~x, data = dat)

ggplot() + geom_point(data = dat, aes(x = x, y = y)) +
  stat_function(data = data.frame(x = c(-5, 15)), aes(x = x), fun = f)

x <- dat$x
y <- f(x)
means <- data.frame(x, y)

dat$group <- 1:100
means$group <- 1:100
groups <- rbind(dat, means)

ggplot() + geom_point(data = dat, aes(x, y)) +
  stat_function(data = data.frame(x = c(-5, 15)), aes(x = x), fun = f) +
  geom_point(data = means, aes(x, y), color = "red", size = 3) +
  geom_line(data = groups, aes(x, y, group = group))

# -------- #
lm(y~x+I(x^2), data = dat)
means$y <- f2(means$x)
groups <- rbind(dat, means)
sum((dat$y-means$y)^2)

ggplot() + geom_point(data = dat, aes(x, y)) +
  stat_function(data = data.frame(x = c(-5, 15)), aes(x = x), fun = f2) +
  geom_point(data = means, aes(x, y), color = "red", size = 3) +
  geom_line(data = groups, aes(x, y, group = group))

# ---- #
lm(y~x+I(x^2)+I(x^3), data = dat)
means$y <- f3(means$x)
groups <- rbind(dat, means)
sum((dat$y-means$y)^2)

ggplot() + geom_point(data = dat, aes(x, y)) +
  stat_function(data = data.frame(x = c(-100, 100)), aes(x = x), fun = f3) +
  geom_point(data = means, aes(x, y), color = "red", size = 3) +
  geom_line(data = groups, aes(x, y, group = group))

# ------ #

fit <- smooth.spline(dat$x, dat$y, df = 50)
# predict(fit, 5)
means$y <- predict(fit, means$x)$y
sum((dat$y-means$y)^2)

ggplot() + geom_point(data = dat, aes(x, y)) +
  stat_function(data = data.frame(x = c(-2, 14)), aes(x = x), fun = f4) +
  geom_point(data = means, aes(x, y), color = "red", size = 3) 
  # geom_line(data = groups, aes(x, y, group = group))


















