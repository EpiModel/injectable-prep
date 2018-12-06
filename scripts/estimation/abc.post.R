
# post-processing of data
fn <- list.files("scripts/estimation/data", pattern = "sim", full.names = TRUE)
fn

load(fn[1])
fsim <- sim
for (i in 2:length(fn)) {
  load(fn[i])
  fsim <- rbind(fsim, sim)
}
dim(fsim)

load("est/nwstats.rda")

# rejection algorithm, weighted threshold
rejection <- function(sim,
                      target.stat = st$stats.p,
                      threshold = 0.05) {

  diff1 <- abs(sim$out1 - target.stat[1])
  diff2 <- abs(sim$out2 - target.stat[2])
  diff3 <- abs(sim$out3 - target.stat[3])
  diff4 <- abs(sim$out4 - target.stat[4])

  diff <- diff1 + diff2 + diff3 + diff4
  cutoff <- quantile(diff, threshold)

  in.threshold <- which(diff <= cutoff)

  post <- sim[in.threshold, ]
  return(post)
}

post <- rejection(fsim, threshold = 0.005)
dim(post)
head(post, 25)

# Accepted adjusted coefficients
stats <- colMeans(post)[5:8]
cbind(st$stats.p, stats)
selection <- colMeans(post)[1:4]
selection # <- c(-13.2053497653944, -0.346004865323799, 1.04989624409589, -0.456503943369997)

# Test it
load("est/fit.rda")
est2 <- est[[2]]
est2$coef.form
est2$coef.form[1:4] <- selection

library(EpiModel)
dx <- netdx(est2, nsteps = 300, nsims = 16, ncores = 8, dynamic = TRUE,
            set.control.ergm = control.simulate.ergm(MCMC.burnin = 1e6))
dx
plot(dx)

# Write out to coefficients
load("est/fit.rda")
est[[2]]$coef.form[1:4] <- selection
save(est, file = "est/fit.rda")
