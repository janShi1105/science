blood <- read.csv('R/blood.csv')
attach(blood)
low <- diastolic.blood.pressure
n <- 50
plot(c(0,n), c(50,90), type='n', xlab='day', ylab='systolic blood pressure')
y1 <- y2 <- numeric(n)
for(i in 3:n){
  y1[i] <- t.test(low[1:i])$conf.int[1]
  y2[i] <- t.test(low[1:i])$conf.int[2]
  segments(i, y1[i], i, y2[i], lwd=2)
}
