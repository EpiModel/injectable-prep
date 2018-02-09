
rm(list = ls())
suppressMessages(library("EpiModelHIV"))
devtools::load_all("~/Dropbox/Dev/EpiModelHIV/EpiModelHIV")

# Main Test Script ----------------------------------------------------

load("est/nwstats.rda")
load("est/fit.rda")

param <- param_msm(nwstats = st,
                   race.method = 1,
                   prep.start = 5000,
                   prep.coverage = 0,
                   riskh.start = 3,
                   prep.timing.lnt = TRUE,
                   prep.indics = 5,
                   prep.sens.start = 30)
init <- init_msm(nwstats = st,
                 prev.B = 0.434,
                 prev.W = 0.132)
control <- control_msm(simno = 1,
                       nsteps = 50,
                       nsims = 1,
                       ncores = 1,
                       initialize.FUN = initialize_msm,
                       aging.FUN = aging_msm,
                       deaths.FUN = deaths_msm,
                       births.FUN = births_msm,
                       test.FUN = test_msm,
                       tx.FUN = tx_msm,
                       progress.FUN = progress_msm,
                       vl.FUN = vl_msm,
                       aiclass.FUN = NULL,
                       roleclass.FUN = NULL,
                       resim_nets.FUN = simnet_msm,
                       disclose.FUN = disclose_msm,
                       acts.FUN = acts_msm,
                       condoms.FUN = condoms_msm,
                       position.FUN = position_msm,
                       prep.FUN = prep_msm,
                       trans.FUN = trans_msm,
                       stitrans.FUN = sti_trans,
                       stirecov.FUN = sti_recov,
                       stitx.FUN = sti_tx,
                       prev.FUN = prevalence_msm,
                       verbose.FUN = verbose_msm)

sim <- netsim(est, param, init, control)

df <- as.data.frame(sim)
names(df)


# Testing/Timing ------------------------------------------------------


dat <- initialize_msm(est, param, init, control, s = 1)

for (at in 2:520) {
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

sapply(dat$attr, length)
