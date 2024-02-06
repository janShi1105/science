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
  vector[T] gamma;
  real<lower = 0> s_z;
  real<lower = 0> s_v;
  real<lower =0> s_s;
}

// The model to be estimated. We model the output
// 'y' to be normally distributed with mean 'mu'
// and standard deviation 'sigma'.
transformed parameters{
  vector[T] alpha;
  for(i in 1:T){
    alpha[i] = mu[i] + gamma[i];
  }
}

model {
  for(i in 3:T){
    mu[i] ~ normal(2 * mu[i-1] - mu[i-2], s_z);
  }
  for(i in 7:T){
    gamma[i] ~ normal(-sum(gamma[(i-6):(i-1)]), s_s);
  }
  for(i in 1:T){
    y[i] ~ normal(alpha[i], s_v);
  }
}

