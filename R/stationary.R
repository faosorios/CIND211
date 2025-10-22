## ID: stationary.R, last updated 2025-10-19, F.Osorio

stationary <- function(x)
{ ## finds the stationary distribution of a Markov
  ## chain with transition matrix 'x'
  z <- t(x)
  x <- eigen(z)$vectors[,1] # 1st column
  x <- as.vector(x / sum(x))
  x
}
