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
  vector[T] ex;
  vector[T] y;
}

// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  vector[T] mu;
  vector[T] b;
  real<lower = 0> s_w;
  real<lower = 0> s_t;
  real<lower = 0> s_v;
}

// The model to be estimated. We model the output
// 'y' to be normally distributed with mean 'mu'
// and standard deviation 'sigma'.
transformed parameters{
  vector[T] alpha;
  for(i in 1:T){
    alpha[i] = mu[i] + b[i] * ex[i];
  }
}

model {
  for(i in 2:T){
    mu[i] ~ normal(mu[i-1], s_w);
    b[i] ~ normal(b[i-1], s_t);
  }
  for(i in 1:T){
    y[i] ~ normal(alpha[i], s_v);
  }
}

