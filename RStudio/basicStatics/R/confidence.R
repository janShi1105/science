count = 0
for(i in 1:10000){
  rand <- rnorm(10,50,10)
  ttest <- t.test(rand, mu=50)
  if(ttest[4]$conf.int[1] > 50 | ttest[4]$conf.int[2] < 50){
    count = count + 1
  }
}
print(count/10000)
