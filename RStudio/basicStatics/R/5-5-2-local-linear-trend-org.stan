//
// This Stan program defines a simple model, with a
// vector of values 'y' modeled as normally distributed
// with mean 'mu' and standard deviation 'sigma'.
//
// Learn more about model development with Stan at:
//
//    http://mc-stan.org/users/interfaces/rstan.html
//    https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started
//

// The input data is a vector 'y' of length 'N'.
data {
  int T;
  vector[T] y;
}

// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  vector[T] mu;
  vector[T] delta;
  real<lower = 0> s_w;
  real<lower = 0> s_z;
  real<lower = 0> s_v;
}

// The model to be estimated. We model the output
// 'y' to be normally distributed with mean 'mu'
// and standard deviation 'sigma'.
model {
  s_w ~ normal(2,2);
  s_z ~ normal(0.5,0.5);
  s_v ~ normal(10,5);
  for(i in 2:T){
    mu[i] ~ normal(mu[i-1] + delta[i-1] , s_w);
    delta[i] ~ normal(delta[i-1], s_z);
  }
  for(i in 1:T){
    y[i] ~ normal(mu[i], s_v);
  }
}

