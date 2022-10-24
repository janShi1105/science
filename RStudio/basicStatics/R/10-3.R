arr <- numeric(10000)
for(i in 1:10000){
  x <- rnorm(i, mean=0, sd=1)
  mad <- median(abs(x-median(x)))*1.4826
  arr[i] <- mad
}
plot(arr)
