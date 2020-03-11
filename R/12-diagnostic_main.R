# In this file we diagnose the `main` network estimated previously

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

# Main --------------------------------------------------------------------

if (!file.exists("out/diag/main.rds")) {
  fit_main <- est[["main"]]

  model_main_dx <- ~edges +
    nodematch("age.grp", diff = TRUE) +
    nodefactor("age.grp", levels = TRUE) +
    nodematch("race", diff = TRUE) +
    nodefactor("race", levels = TRUE) +
    nodefactor("deg.casl", levels = TRUE) +
    concurrent +
    degrange(from = 3) +
    nodematch("role.class", diff = TRUE) +
    degree(0:3)

  dx_main <- netdx(fit_main, nsims = nsims, ncores = ncores, nsteps = nsteps,
                   nwstats.formula = model_main_dx, skip.dissolution = TRUE,
                   set.control.ergm = control.simulate.ergm(MCMC.burnin = 1e5))

  saveRDS(dx_main, "out/diag/main.rds", compress = comp_method)
} else {
  dx_main <- readRDS("out/diag/main.rds")
}

print(dx_main, digits = 1)

dx_plot_write(dx_main, "out/diag/main.jpeg")

netstats$main
