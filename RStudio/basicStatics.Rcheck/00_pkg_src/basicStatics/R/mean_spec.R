mean_spec <- numeric(length=10000)
median_spec <- numeric(length=10000)

for(i in 1:10000){
  spec <- rnorm(n=100, mean=50, sd=10)
  mean_spec[i] <- mean(spec)
  median_spec[i] <-median(spec)
}
error_abs5 <- ifelse(abs(mean_spec-50)<=5, 1,0)
var_spec <- numeric(length=10000)
unbia_spec <- numeric(length=10000)


theory_spec <- numeric(length=10000)

for (i in 1:10000){
  spec <- rnorm(n=25, mean=0, sd=1)
  theory_spec[i] <- mean(spec)
}

for (i in 1:10000){
  spec <- rnorm(n=10, mean=50, sd=10)
  var_spec[i] <- mean((spec - mean(spec))^2)
  unbia_spec[i] <-var(spec)
}




