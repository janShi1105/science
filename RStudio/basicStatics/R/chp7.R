A <- c(15,9,18,14,18)
B <- c(13,8,8,12,7)
C <- c(10,6,11,7,12)
D <- c(10,7,3,5,7)

static_test2 <- c(A,B,C,D)

teach_method <- c(rep("A", 5), rep("B", 5), rep("C", 5), rep("D", 5))
teach_method2 <- factor(teach_method)

all <- cbind(A,B,C,D)
favorability <- c(7,8,9,5,6,5,4,7,1,3,8,6,7,2,5)
subject <- factor(c(rep('linarg', 5), rep('calc', 5), rep('prob', 5)))

person <- factor(rep(c('Tanaka','Kishi', 'oohiki', 'yoshikawa', 'hagino'),3))

all_data  <- matrix(favorability, nrow=5, ncol=3)

taste <- c(6,4,5,3,2,10,8,10,8,9,11,12,12,10,10,5,4,2,2,2,7,6,5,4,3,12,8,5,6,4)
temp <- factor(c(rep('refr', 15), rep('norm', 15)))
brand <- factor(rep(c(rep('Ikan', 5), rep('Bossbig', 5), rep('Bibi', 5)), 2))

person1 <- factor(rep(c('muramatsu', 'kawasaki', 'iguchi', 'matsunaka', 'jojima'), 6))
conditionA1 <- rep(c('muramatsu', 'kawasaki', 'iguchi', 'muranaka', 'jojima'),3)
conditionA2 <- rep(c('saito', 'wada', 'terahara', 'sugiuchi', 'niigaki'),3)
person2 <- factor(c(conditionA1, conditionA2))
