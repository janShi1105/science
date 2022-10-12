# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

varp <- function(x) {
    標本分散 <- var(x)*(length(x)-1)/length(x)
    標本分散
  }
x <- c(10, 13, 8, 15, 8)
print(x)
var(x)
varp(x)

