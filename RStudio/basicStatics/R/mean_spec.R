mean_spec <- numeric(length=10000)

for(i in 1:10000){
  spec <- rnorm(n=100, mean=50, sd=10)
  mean_spec[i] <- mean(spec)
}
error_abs5 <- ifelse(abs(mean_spec-50)<=5, 1,0)

