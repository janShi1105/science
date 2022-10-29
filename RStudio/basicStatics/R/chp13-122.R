n <- 30
plot(c(0,n), c(35,65), type='n', axes=FALSE, xlab='', ylab='')
axis(1)
abline(h=50)
y1  <- y2 <- numeric(n)
for(i in 1:n){
  y <- rnorm(20,50,10)
  y1[i] <- t.test(y)$conf.int[1]
  y2[i] <- t.test(y)$conf.int[2]
  segments(i, y1[i], i, y2[i], lwd=2)
}
