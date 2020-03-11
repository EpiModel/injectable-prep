# In this file we diagnose the `oneoff` network estimated previously

library(EpiModelHIV)
source("R/utils-diag_plot.R")

comp_method = FALSE

if (!file.exists("out/diag"))
  dir.create("out/diag", recursive = T)

est <- readRDS("out/est/netest.rds")
netstats <- readRDS("out/est/netstats.rds")

# Meta parameters
nsims  <- 10
ncores <- 5
nsteps <- 500

# One-Off -----------------------------------------------------------------

if (!file.exists("out/diag/one_time.rds")) {
  fit_inst <- est[["one_time"]]

  model_inst_dx <- ~edges +
    nodematch("age.grp", diff = FALSE) +
    nodefactor("age.grp", levels = TRUE) +
    nodematch("race", diff = TRUE) +
    nodefactor("race", levels = TRUE) +
    nodefactor("risk.grp", levels = TRUE) +
    nodefactor("deg.tot", levels = TRUE) +
    nodematch("role.class", diff = TRUE) +
    degree(0:4)

  dx_inst <- netdx(fit_inst, nsims = 10000, dynamic = FALSE,
                   nwstats.formula = model_inst_dx,
                   set.control.ergm = control.simulate.ergm(MCMC.burnin = 1e5))

  saveRDS(dx_inst, "out/diag/one_time.rds", compress = comp_method)
} else {
  dx_inst <- readRDS("out/diag/one_time.rds")
}

print(dx_inst, digits = 1)

## plot(dx_inst, sim.lines = TRUE, sim.lwd = 0.2)
dx_plot_write(dx_inst, "out/diag/one_time.jpeg")

netstats$inst
