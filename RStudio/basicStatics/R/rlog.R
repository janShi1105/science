rlognormal <- function(nsize=10,mean=1,sd=1){
  a <- log(1 + sd^2/mean^2)
  mean_log <- log(mean)- 0.5*a
  sd_log <- sqrt(a)
  return(rlnorm(nsize, meanlog=mean_log, sdlog=sd_log))
  }
