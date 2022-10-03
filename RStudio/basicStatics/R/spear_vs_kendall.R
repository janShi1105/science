M <- 10
N <- 200
x <- matrix(runif(M*N, 0, 1), nrow=M, ncol=N)
y <- matrix(runif(M*N, 0, 1), nrow=M, ncol=N)
sz <- cor(x, y, method='spearman')
kz <- cor(x, y, method='kendall')
