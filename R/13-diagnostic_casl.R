# In this file we diagnose the `casual` network estimated previously

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

# Casual ------------------------------------------------------------------

if (!file.exists("out/diag/casual.rds")) {
  fit_casl <- est[["casual"]]

  model_casl_dx <- ~edges +
    nodematch("age.grp", diff = TRUE) +
    nodefactor("age.grp", levels = TRUE) +
    nodematch("race", diff = TRUE) +
    nodefactor("race", levels = TRUE) +
    nodefactor("deg.main", levels = TRUE) +
    concurrent +
    degrange(from = 4) +
    nodematch("role.class", diff = TRUE) +
    degree(0:4)

  dx_casl <- netdx(fit_casl, nsims = nsims, ncores = ncores, nsteps = nsteps,
                   nwstats.formula = model_casl_dx, skip.dissolution = TRUE,
                   set.control.ergm = control.simulate.ergm(MCMC.burnin = 1e5))

  saveRDS(dx_casl, "out/diag/casual.rds", compress = comp_method)
} else {
  dx_casl <- readRDS("out/diag/casual.rds")
}

print(dx_casl, digits = 1)

## dx_plot(dx_casl)
dx_plot_write(dx_casl, "out/diag/casual.jpeg")

netstats$casl
