
## PrEP discontinuation calculation

# Given a certain proportion of MSM discontinuing PrEP by day X, what is the
# daily probability of discontinuing given a geometric distribution?

# Consider that 50% have discontinued after 1 year (365 days)
# This simulates the process with a 25% coverage level

# The daily drop off rate is function of the mean of the geometric distribution
# which relates to the median in the following form
1-(2^(-1/365))

# So the mean time on PrEP associated with a median of 365 is:
1/(1-(2^(-1/365)))

# Let's check it with a simulation:
sim <- function(med.dur = 365, cov = 0.25) {

  do.rate <- 1-(2^(-1/med.dur))

  pstat <- rbinom(1000, 1, cov)
  nprep <- sum(pstat == 1)

  nsteps <- 365 * 10

  for (i in 2:nsteps) {

    elig.stop <- which(pstat == 1)
    vec.stop <- rbinom(length(elig.stop), 1, do.rate)
    ids.stop <- elig.stop[which(vec.stop == 1)]
    if (length(ids.stop) > 0) {
      pstat[ids.stop] <- 0
    }
    nprep[i] <- sum(pstat == 1)
  }
  nprep <- nprep/(1000*cov)
  return(nprep)
}

# Run lots of simulations
med.dur <- 365
cov <- 0.25
sims <- replicate(100, sim(med.dur = med.dur, cov = cov))

# Plot the results
par(mar = c(3,3,1,1), mgp = c(2,1,0))
plot(x = 1, y = 1, type = "n", ylim = c(0, 1), xlim = c(0, 3650))
for (j in 1:ncol(sims)) {
  lines(sims[, j], lwd = 0.3, type = "s", col = adjustcolor("seagreen", alpha.f = 0.2))
}
abline(h = 0.5, v = med.dur, lty = 2)
text(1, 0.1, round(rowMeans(sims)[med.dur], 3))

# Next, given the CDF is: 1-(1-p)^k where p = is the rate parameter and k is the
# day. We need that since we have the cumulative proportion at week 48 (day 337)
# and want to calculate the rate associated with that propability

# If 50% drop off by 365 days, what proportion drop off at 337 days?
do.rate <- 1-(2^(-1/365))
cdf <- 1-(1-do.rate)^337
cdf

# Rearrange to solve for median
-((337*log(2))/log(1-cdf))

# create general function
cdf <- function(p, k) -((k*log(2))/log(1-p))

# Black proportion who had stopped at 48 weeks
cdf(0.4375, 337)

1-(1-(1-2^(-1/405.9874)))^337

# White proportion who had stopped at 48 weeks
cdf(0.1831, 337)

1-(1-(1-2^(-1/1155.025)))^337


# Plug it in and plot it
med.dur <- cdf(0.4375, 337)
cov <- 0.25
sims <- replicate(200, sim(med.dur = med.dur, cov = cov))

# Plot the results
par(mar = c(3,3,1,1), mgp = c(2,1,0))
plot(x = 1, y = 1, type = "n", ylim = c(0, 1), xlim = c(0, 3650))
for (j in 1:ncol(sims)) {
  lines(sims[, j], lwd = 0.3, type = "s", col = adjustcolor("seagreen", alpha.f = 0.2))
}
abline(h = 1 - 0.4375, v = 337, lty = 2)
text(1, 0.1, round(1 - rowMeans(sims)[337], 3))


# Update for new LA PrEP Model

# 57% retained at 6m, so 1-0.57 = overall proportion who had stopped at 6 months
cdf(0.43, 182)

med.dur <- cdf(0.43, 182)
cov <- 0.25
sims <- replicate(200, sim(med.dur = med.dur, cov = cov))

# Plot the results
par(mar = c(3,3,1,1), mgp = c(2,1,0))
plot(x = 1, y = 1, type = "n", ylim = c(0, 1), xlim = c(0, 3650))
for (j in 1:ncol(sims)) {
  lines(sims[, j], lwd = 0.3, type = "s", col = adjustcolor("seagreen", alpha.f = 0.2))
}
abline(h = 1 - 0.43, v = 182, lty = 2)
text(1, 0.1, round(1 - rowMeans(sims)[182], 3))
