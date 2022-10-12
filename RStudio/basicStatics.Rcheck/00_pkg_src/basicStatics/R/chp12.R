
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



model.coop <- specify.model()
mother_val -> y1, b11, NA
mother_val -> y2, b21, NA
mother_val -> y3, b31, NA
mother_val -> y4, b41, NA
mutual_ex -> y5, NA, 1
mutual_ex -> y6, b62, NA
mutual_ex -> y7,  b72, NA
mutual_ex -> y8, b82, NA
coop -> y9, NA,1
coop -> y10, b103, NA
coop -> y11, b113, NA
coop -> y12, b123, NA
mother_val -> mutual_ex, g21, NA
mother_val -> coop, g31, NA
y1 <-> y1, e1, NA
y2 <-> y2, e2, NA
y3 <-> y3, e3, NA
y4 <-> y4, e4, NA
y5 <-> y5,  e5, NA
y6 <-> y6, e6, NA
y7 <-> y7, e7, NA
y8 <-> y8, e8, NA
y9 <-> y9,e9, NA
y10 <-> y10, e10, NA
y11 <-> y11, e11, NA
y12 <-> y12, e12, NA
mother_val <->mother_val,NA, 1
mutual_ex <-> mutual_ex, delta2, NA
coop <-> coop, delta3, NA
