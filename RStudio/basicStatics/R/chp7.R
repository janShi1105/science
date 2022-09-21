A <- c(15,9,18,14,18)
B <- c(13,8,8,12,7)
C <- c(10,6,11,7,12)
D <- c(10,7,3,5,7)

static_test2 <- c(A,B,C,D)

teach_method <- c(rep("A", 5), rep("B", 5), rep("C", 5), rep("D", 5))
teach_method2 <- factor(teach_method)

all <- cbind(A,B,C,D)
