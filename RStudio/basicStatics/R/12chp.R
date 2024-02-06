library(MASS)
mu<- c(2,1)
Sigma <- matrix(c(16,0,0,9), nrow = 2, ncol = 2)
m <- 1000
n <- 20
r <- numeric(m)
for(i in 1:m){
  xydata <- mvrnorm(n, mu, Sigma)
  r[i] <- cor(xydata[,1], xydata[,2])
}
t0 <- sqrt(n-2) * r/sqrt(1-r^2)
hist(t0, xlim = c(-6,6), ylim = c(0,0.45), prob = TRUE, bins = 10)
par(new=TRUE)
plot(function(x) dt(x,df=n-2), xlim = c(-6,6), ylim = c(0,0.45), xlab = '', ylab ='', main ='', lwd=2)
