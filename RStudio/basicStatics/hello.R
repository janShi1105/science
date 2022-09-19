# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

teaching_method <- c('C', 'B', 'B', 'A', 'B', 'C', 'A', 'D', 'D', 'D', 'A', 'A', 'A', 'C', 'B', 'D','C', 'C', 'B', 'D'  )
phycological_test <- c(13,14,7,12,10, 6,8,15,4,14,9,6,10,12,5,12,8,8,12,15)
test_a<- c(10,13,8,15,8)
test_a_mean <-mean(test_a)
std_from_mean <- test_a - test_a_mean
square_std <- std_from_mean^2
sum_square<-sum(square_std)
num_data <-length(test_a)
n_std <- var(test_a)
std <- n_std*(num_data -1)/num_data
mean_phycological <- mean(phycological_test)
std_norm_phyco <- sqrt(mean((phycological_test - mean_phycological)^2))
z_phyco <- (phycological_test - mean_phycological)/std_norm_phyco
mean_z_phyco <-mean(z_phyco)
std_z_phyco <- sqrt(mean((z_phyco - mean_z_phyco)^2))
stat_test <- c(6,10,6,10,5,3,5,9,3,3,11,6,11,9,7,5,8,7,7,9)
mean_stat <-mean(stat_test)
std_norm_stat <- sqrt(mean((stat_test - mean_stat)^2))
stat_norm <- (stat_test - mean_stat)/std_norm_stat
dev_phyco <- 10 * z_phyco + 50
mean_dev_phyco <-mean(dev_phyco)
std_dev_phyco <- sqrt(mean((dev_phyco - mean_dev_phyco)^2))
univ_a <- c(60, 100, 50, 40, 50, 230, 120, 240, 200, 30)
univ_b <- c(50, 60, 40, 50, 100, 80, 30, 20, 100, 120)

