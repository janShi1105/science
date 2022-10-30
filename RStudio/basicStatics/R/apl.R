aapl <- read.csv('R/aapl.csv', na.strings = c('null'))
aapl <- subset(aapl, complete.cases(aapl))

aapldiff <- diff(log(aapl$Close))
