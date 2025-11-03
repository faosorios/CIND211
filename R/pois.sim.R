# pois.sim.R

pois.sim <- function(lambda = 1, time = 10)
{ # Simulating a Poisson process on [0,t]
  n <- rpois(1, lambda * time)
  u <- runif(n, min = 0, max = time)
  arrivals <- sort(u)
  arrivals
}
