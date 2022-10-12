teach_method <- read.csv('R/shidouhouU8.csv')

mapping <- c("好き" =1, "嫌い"=0)

hanshin <- data.frame(name=c('toritani', 'akaboshi', 'sheets', 'kanamoto', 'Willams', 'kubota', 'fujikawa'),
                      blood = c("B", "A", "A", "O", NA, "AB", "A"),
                      height = c(179,170,188,180,183,181,184),
                      weight = c(82,67,89,88,89,94,83),
                      age = c(26,31,36,39,35,26,27))

sweets1 <- data.frame(ice=1:10, choco=101:110, candy=rep(1,10))
sweets2 <- data.frame(ice=10:1, choco=110:101, candy=rep(5,10))
