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
  int len_obs;
  int y[len_obs];
  int obs_no[len_obs];
}

// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  vector[T] mu;
  real<lower = 0> s_w;
}

// The model to be estimated. We model the output
// 'y' to be normally distributed with mean 'mu'
// and standard deviation 'sigma'.
model {
  s_w ~ student_t(3,0,10);
  for(i in 2:T){
    mu[i] ~ normal(mu[i-1], s_w);
  }
  for(i in 1:len_obs){
    y[i] ~ bernoulli_logit(mu[obs_no[i]]);
  }
}
generated quantities{
  vector[T] probs;
  probs = inv_logit(mu);
}

