n <- 10^3
r <- rexp(n,rate=2.3)
x <- 0
xnum<- 0
count<-0
time <- 0
for(i in 1:n){
  time <- time + r[i]
  if(time < 1) count <- count + 1
  else{
    x[xnum] <- count
    xnum <- xnum + 1
    time <- 0
    count <- 0
    }
  }
barplot(table(x)/xnum)
lt <- read.csv('R/lifetable.csv')
