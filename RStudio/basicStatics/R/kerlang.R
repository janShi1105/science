kerlang <- function(k=2){
  x <- rexp(k*100000, rate=1)
  xm <- matrix(x,nrow=100000, ncol=k)
  s <- apply(xm,1,sum)
  hist(s, prob=TRUE)
}
