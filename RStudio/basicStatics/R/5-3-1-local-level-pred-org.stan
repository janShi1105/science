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
  int pred_term;
}

// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  vector[T] mu;
  real<lower = 0> s_w;
  real<lower = 0> s_v;
}

// The model to be estimated. We model the output
// 'y' to be normally distributed with mean 'mu'
// and standard deviation 'sigma'.
model {
  for(i in 2:T){
    mu[i] ~ normal(mu[i-1], s_w);
  }
  for(i in 1:T){
    y[i] ~ normal(mu[i], s_v);
  }
}

generated  quantities{
  vector[T +pred_term] mu_pred;
  mu_pred[1:T] = mu;
  for(i in 1:pred_term){
    mu_pred[T + i] = normal_rng(mu_pred[T + i -1], s_w);
  }
}

