library(MASS)
mu <- c(2,1)
Sigma <- matrix(c(16,2,2,9), nrow = 2, ncol = 2)
m <- 1000
n <- 20
r <- numeric(m)
r0 <- 1/6
tmean <- 0.5 * log((1 + r0)/ (1-r0))
for(i in 1:m){
  xydata <- mvrnorm(n, mu, Sigma)
  r[i] <- cor(xydata[,1], xydata[,2])
}
z <- 0.5  * log((1+r)/(1-r))
hist(z, xlim = c(-2,2), ylim = c(0,2), prob=TRUE)
par(new=TRUE)
plot(function(x)dnorm(x,mean=tmean, sd=1/sqrt(n-3)), xlim = c(-2,2), ylim = c(0,2), xlab='', ylab ='', main ='', lwd=2)
