x <- rnorm(100000, 10, 5)
xm<- matrix(x, nrow=10000, ncol=10)
unbiased_var <- apply(xm, 1, var)
biased_var <- (9/10) * unbiased_var
hist(biased_var)
abline(v=25, lwd=2)
abline(v=mean(biased_var), lwd=2, lty='dashed')
