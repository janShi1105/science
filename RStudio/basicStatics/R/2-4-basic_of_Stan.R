# load packages
library(rstan)

# fasten calc
rstan_options(auto_write = TRUE)
options(mc.cores = parallel::detectCores())

# data analysed
file_beer_sales_1 <- read.csv('R/2-4-1-beer-sales-1.csv')

mcmc_result <- stan(
  file = "2-4-1-calc-mean-variance.stan",
  data = data_list,
  seed = 1,
  chains = 4,
  iter = 2000,
  warmup = 1000,
  thin = 1
)
