degf <- 10:200
qtf <- qt(0.975, degf)
plot(degf, qtf, type='l', ylim=c(1.9, 2.25))
abline(h=qnorm(0.975), lwd=2)
