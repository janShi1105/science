M <- 50
N <- 200
x <- matrix(runif(M*N, 0, 1), nrow=M, ncol=N)
y <- matrix(runif(M*N, 0, 1), nrow=M, ncol=N)
sz <- cor(x, y, method='spearman')
kz <- cor(x, y, method='kendall')
plot(sz,kz,xlim=c(-1,1), ylim=c(-1,1), xlab='Spearman', ylab='Kendall', pch=20,cex=0.2)
par(new=TRUE)
curve(2*x/3, xlim=c(-1,1), ylim=c(-1,1), xlab='', ylab='')
