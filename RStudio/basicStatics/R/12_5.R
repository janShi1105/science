mu <- c(2,1)
Sigma <- matrix(c(16,2,2,9), ncol =2, nrow = 2)
n <-100
xydata <- mvrnorm(n,mu,Sigma)
X <- xydata[,1]
Y <- xydata[,2]
dataEllipse(X,Y,level=0.8)
