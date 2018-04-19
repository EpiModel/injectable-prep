
rm(list = ls())
suppressMessages(library("EpiModelHIV"))
devtools::load_all("~/Dropbox/Dev/EpiModelHIV/EpiModelHIV")

# Main Test Script ----------------------------------------------------

scr.dir <- "~/Box Sync/Injectable PrEP ABM study/injectable-prep/"
load(file.path(scr.dir, "est/nwstats.rda"))
load(file.path(scr.dir, "est/fit.rda"))

param <- param_msm(nwstats = st,
                   race.method = 1,
                   riskh.start = 1,
                   prep.start = 26,
                   prep.la.start = 26,
                   prep.replace.mod = "curr.oral",
                   prep.class.hr = c(0.69, 0.19, 0.02),
                   prep.coverage = 0.2,
                   prep.coverage.la = 0.1,
                   prep.adhr.dist = c(0.089, 0.127, 0.785),
                   prep.adhr.dist.la = c(0.20, 0.80),
                   prep.discont.rate = 1-(2^(-1/781)),
                   prep.hadr.int = 8 * 7,
                   prep.ladr.int = 16 * 7,
                   prepla.dlevel.icpt = 4.5,
                   prepla.dlevel.icpt.err = 2.5/3,
                   prepla.dlevel.slope = 25,
                   prep.la.hr = c(0.75, 0.50, 0.02),
                   prep.tst.int = 90,
                   prep.risk.int = 182,
                   prep.risk.reassess.method = "year",
                   rcomp.prob = 0.41,
                   rcomp.adh.groups = 2:3,
                   rcomp.main.only = FALSE,
                   rcomp.discl.only = FALSE)
init <- init_msm(nwstats = st,
                 prev.B = 0.260,
                 prev.W = 0.260)
control <- control_msm(simno = 1,
                       nsteps = 200,
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

# sim <- netsim(est, param, init, control)

# df <- as.data.frame(sim)
# names(df)


# Testing/Timing ------------------------------------------------------


dat <- initialize_msm(est, param, init, control, s = 1)

for (at in 2:104) {
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

length(unique(sapply(dat$attr, length)))
names(dat$attr)
table(dat$attr$prepStat, dat$attr$prepElig)
