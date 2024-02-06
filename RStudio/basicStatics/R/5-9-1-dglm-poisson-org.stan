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
  int y[T];
}

// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  vector[T] mu;
  vector[T] r;
  real b;
  real<lower = 0>s_z;
  real<lower=0> s_r;
}
transformed parameters{
  vector[T] lambda;
  for(i in 1:T){
    lambda[i] = mu[i] + b * ex[i] + r[i];
  }
}

// The model to be estimated. We model the output
// 'y' to be normally distributed with mean 'mu'
// and standard deviation 'sigma'.
model {
  r ~ normal(0, s_r);
  for(i in 3:T){
    mu[i] ~ normal(2 * mu[i-1] - mu[i-2], s_z);
  }
  for(i in 1:T){
    y[i] ~ poisson_log(lambda[i]);
  }
}

generated quantities{
  vector[T] lambda_exp;
  vector[T] lambda_smooth;
  vector[T] lambda_smooth_fix;
  lambda_exp = exp(lambda);
  lambda_smooth = exp(mu + b * ex);
  lambda_smooth_fix = exp(mu + b * mean(ex));
}

