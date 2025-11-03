# bus.R
# Memorylessness and bus waiting times

trials <- 5000
first <- numeric(trials)
second <- numeric(trials)
for (i in 1:trials) {
  bus <- rexp(1,1/30)
  first[i] <- bus
  while (bus < 10) { bus <- bus + rexp(1,1/30) }
  second[i] <- bus - 10
}

m1 <- mean(first)
m2 <- mean(second)

par(mfrow = c(1,2), pty = "s")
hist(first,xlab="First", prob=T,ylab="",main="",yaxt="n")
hist(second,xlab="Second",prob=T,ylab="",yaxt="n",main="")
