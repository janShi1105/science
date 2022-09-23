
prepost <- read.csv('prepost.csv')

set.seed(1234)
切片 <- 102.385888
父係数 <- 0.316514
母係数 <- 0.021370
father <- rnorm(n=19, mean=166.84211, sd=5.90916)
mother <- rnorm(n=19, mean=155.94737, sd=4.63649)
残差 <- rnorm(n=19, mean=0, sd=2.15664)
daughter <- 切片 + 父係数 * father + 母係数 * mother + 残差
chap15data <- data.frame(cbind(daughter, father, mother))

