
# PrEP Race Diagnostics

suppressMessages(library("EpiModelHIV"))
rm(list = ls())

load("est/fit.rda")

# Main model diagnostics

dx.m <- netdx(est[[1]], nsims = 10, nsteps = 500, dynamic = TRUE,
              set.control.ergm = control.simulate.ergm(MCMC.burnin = 1e6))

print(dx.m)
plot(dx.m, qnts.alpha = 0.9)


# Casual model diagnostics

dx.c <- netdx(est[[2]], nsims = 10, nsteps = 500, dynamic = TRUE,
              set.control.ergm = control.simulate.ergm(MCMC.burnin = 1e6))

print(dx.c)
plot(dx.c, qnts.alpha = 0.8)


# One-off model diagnostics

mcmc.diagnostics(est[[3]]$fit)

dx.i <- netdx(est[[3]], nsims = 10000, dynamic = FALSE)

print(dx.i)
# plot(dx.i)
