MLweibull <- function(x, k0=1, s0=1, MAX=10000, epsilon=0.000001){
  k <- k0
  s <- s0
  lnx <- log(x)
  for (i in 1:MAX){
    s_before <- s
    k_before <- k
    xk <- x^k
    s <- 1/mean(xk)
    k <- 1/(s*mean(xk*lnx)-mean(lnx))
    if(max(abs(s-s_before), abs(k-k_before))<epsilon){
      ErrorFlag <- FALSE
      break
    }
  }
  if(ErrorFlag){
    warning('not converge')
  }
  lambda <- (1/s)^(1/k)
  return(c('k'=k, 'lambda'=lambda))
}
