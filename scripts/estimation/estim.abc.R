
library(methods)
suppressMessages(library(EpiModel))
library(doParallel)
library(foreach)

## Environmental Arguments
simno <- as.numeric(Sys.getenv("SLURM_ARRAY_TASK_ID"))

load("est/fit.rda")


# Casual Network ----------------------------------------------------------

# Pull casual network
est <- est[[2]]

# calibration function
f <- function(est) {

  est$coef.form[1] <- est$coef.form[1] + runif(1, -0.15, 0.15)
  est$coef.form[2] <- est$coef.form[2] + runif(1, -0.15, 0.15)
  est$coef.form[3] <- est$coef.form[3] + runif(1, -0.15, 0.15)
  est$coef.form[4] <- est$coef.form[4] + runif(1, -0.15, 0.15)

  dx <- netdx(est, nsims = 1, nsteps = 300, verbose = FALSE,
              set.control.ergm = control.simulate.ergm(MCMC.burnin = 1e5))
  stat1 <- mean(tail(dx$stats[[1]][, 1], 100))
  stat2 <- mean(tail(dx$stats[[1]][, 2], 100))
  stat3 <- mean(tail(dx$stats[[1]][, 3], 100))
  stat4 <- mean(tail(dx$stats[[1]][, 4], 100))
  return(c(p1 = est$coef.form[1],
           p2 = est$coef.form[2],
           p3 = est$coef.form[3],
           p4 = est$coef.form[4],
           out1 = stat1,
           out2 = stat2,
           out3 = stat3,
           out4 = stat4))
}

# Run parallel on each node
registerDoParallel(16)
nsims <- 500
sout <- foreach(s = 1:nsims) %dopar% {
  f(est)
}

sim <- as.data.frame(do.call("rbind", sout))
save(sim, file = paste0("data/sim.", simno, ".rda"))
