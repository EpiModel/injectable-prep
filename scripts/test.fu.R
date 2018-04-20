
rm(list = ls())
suppressMessages(library("EpiModelHIV"))
devtools::load_all("~/Dropbox/Dev/EpiModelHIV/EpiModelHIV")

# Main Test Script ----------------------------------------------------

## Parameters
load("est/nwstats.rda")

param <- param_msm(nwstats = st,
                   race.method = 1,
                   riskh.start = 2500,

                   prep.start = 2601,          ## fixed
                   prep.la.start = 2860,       ## fixed

                   prep.coverage = 0.2,        ## mod1
                   prep.coverage.la = 0.1,     ## mod1
                   prep.replace.mod = "all",   ## mod1

                   prep.class.hr = c(0.69, 0.19, 0.02),      ## fixed
                   prep.adhr.dist = c(0.089, 0.127, 0.785),   ## fixed
                   prep.adhr.dist.la = c(0.215, 0.785),     ## mod3
                   prep.discont.rate = 1-(2^(-1/781)),      ## fixed

                   prep.hadr.int = 8 * 7,                   ## fixed
                   prep.ladr.int = 12 * 7,                  ## mod3

                   prepla.dlevel.icpt = 4.5,                ## fixed, SA
                   prepla.dlevel.icpt.err = 2.5/3,          ## fixed, SA
                   prepla.dlevel.slope = 25,                ## fixed, SA
                   prep.la.hr = c(0.15, 0.05, 0.02),        ## mod2
)

init <- init_msm(st)

control <- control_msm(simno = 1,
                       start = 2601,
                       nsteps = 2900,
                       nsims = 1,
                       ncores = 1,
                       initialize.FUN = reinit_msm,
                       verbose = TRUE)

load("est/lap.burnin.rda")
sim <- netsim(sim, param, init, control)

df <- as.data.frame(sim)



# Testing/Timing ------------------------------------------------------

debug(deaths_msm)
debug(prevalence_msm)

dat <- reinit_msm(sim, param, init, control, s = 1)

for (at in 2601:2800) {
  dat <- aging_msm(dat, at)
  dat <- deaths_msm(dat, at)
  dat <- births_msm(dat, at)
  dat <- test_msm(dat, at)
  dat <- tx_msm(dat, at)
  dat <- progress_msm(dat, at)
  dat <- vl_msm(dat, at)
  dat <- simnet_msm(dat, at)
  dat <- disclose_msm(dat, at)
  dat <- acts_msm(dat, at)
  dat <- condoms_msm(dat, at)
  dat <- position_msm(dat, at)
  dat <- prep_msm(dat, at)
  dat <- trans_msm(dat, at)
  dat <- sti_trans(dat, at)
  dat <- sti_recov(dat, at)
  dat <- sti_tx(dat, at)
  dat <- prevalence_msm(dat, at)
  cat(at, ".", sep = "")
}
