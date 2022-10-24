x <- rcauchy(10000,location = 3, scale=5)

fit <- fitdistr(x, 'cauchy')
print(fit)
