## ID: matrix.power.R, last updated 2025-10-18, F.Osorio

matrix.power <- function(a, pow = 2)
{ ## computes the power of a square matrix
  if (is.data.frame(a))
    a <- as.matrix(a)
  if (!is.matrix(a))
    stop("supply a matrix-like 'a'")
  if (!is.numeric(a))
    stop("argument a is not a numeric matrix")

  da <- dim(a)
  n <- da[1]
  p <- da[2]
  if (n != p)
    stop("argument a is not a square matrix")

  if (pow < 0)
    stop("only implemented for positive power")
  z <- a
  k <- pow
  if (k == 0)
    return (diag(n))
  if (k == 1)
    return (z)
  if (k > 1)
    return(z %*% matrix.power(z, pow = k - 1))
}
