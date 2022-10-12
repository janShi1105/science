life_table <- read.csv('R/lifetable.csv')
attach(life_table)
plot(age, deathrate)
