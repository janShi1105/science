sample_size <-  nrow(animal_num)
data_list<- list(animal_num = animal_num$animal_num, N = sample_size)

mcmc_normal <- stan(
  file = '2-5-1-normal-dist.stan',
  data = data_list,
  seed = 1
)

mcmc_poisson <- stan(
  file = '2-5-2-poisson-dist.stan',
  data = data_list,
  seed = 1
)
