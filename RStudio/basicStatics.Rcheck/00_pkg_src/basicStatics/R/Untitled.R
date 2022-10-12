num_iter <- 10000
err1 <- 0
for(i in 1:num_iter){
  gA <- rnorm(10)
  gB <- rnorm(10)
  gC <- rnorm(10)
  test1 <- t.test(gA,gB, var.equal = TRUE)
  test2 <- t.test(gB,gC, var.equal = TRUE)
  test3 <- t.test(gC,gA,var.equal = TRUE)
  err1 <- err1 + ifelse(test1$p.value < 0.05 | test2$p.value < 0.05 | test3$p.value < .05,1,0)
}
err1/num_iter

