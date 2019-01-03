
rm(list = ls())
suppressMessages(library("EpiModelHIV"))
devtools::load_all("~/Dropbox/Dev/EpiModelHIV/EpiModelHIV-p")

# Main Test Script ----------------------------------------------------

setwd("~/Box Sync/Injectable PrEP ABM study/injectable-prep/")

## Parameters
load("est/nwstats.rda")

psp <- 0.295
ppi <- 0.5

param <- param_msm(nwstats = st,
                   race.method = 1,
                   riskh.start = 2500,

                   prep.start = 2601,
                   prep.la.start = 2601, #2861,

                   prep.start.prob = psp,
                   prep.prob.oral = 1 - ppi,

                   prep.adhr.dist = c(0.089, 0.127, 0.785),
                   prep.adhr.hr = c(0.69, 0.19, 0.02),

                   prep.discont.rate = 1 - (2^(-1/224.4237)),
                   prepla.discont.rate = 1 - (2^(-1/224.4237)),

                   prep.inj.int = 8 * 7,

                   prep.adhr.dist.la = c(0.215, 0.785),
                   prepla.dlevel.icpt = 3.59,
                   prepla.dlevel.icpt.err = 2,
                   prepla.dlevel.halflife.int = 35,
                   prep.la.hr.beta = -9.0599,
                   prep.la.hr.rel = 1,

                   prep.tst.int = 90,
                   prep.risk.int = 182,
                   prep.risk.reassess.method = "year",

                   prep.sti.screen.int = 182,
                   prep.la.sti.screen.int = 121,
                   prep.sti.prob.tx = 1)

init <- init_msm(st)

control <- control_msm(simno = 1,
                       start = 2601,
                       nsteps = 3380,
                       nsims = 1,
                       ncores = 1,
                       initialize.FUN = reinit_msm,
                       verbose = TRUE)

load("est/lap.burnin.rda")
sim <- netsim(sim, param, init, control)



df <- as.data.frame(sim)
s2 <- truncate_sim(sim, at = 2600)
s2 <- mutate_epi(s2, prepCurr.tot = prepCurr + prepCurr.la)
s2 <- mutate_epi(s2, pfrac.tot = prepCurr.tot / num,
                     pfrac.oral = prepCurr / num,
                     pfrac.inj = prepCurr.la / num)

par(mar = c(3,3,2,1), mgp = c(2,1,0))
plot(s2, y = "prepElig", main = "elig for Oral PrEP")
plot(s2, y = "prepCurr", mean.smooth = FALSE, mean.lwd = 1, main = "on Oral PrEP")
plot(s2, y = "prepElig.la", main = "elig for Inj PrEP")
plot(s2, y = "prepCurr.la", mean.smooth = FALSE, mean.lwd = 1, main = "on Inj PrEP")
plot(s2, y = "prepCurr.tot", mean.smooth = FALSE, mean.lwd = 1, main = "on Inj PrEP")

plot(s2, y = "ir100")
plot(s2, y = "i.prev")

plot(s2, y = c("pfrac.inj", "pfrac.oral"), legend = TRUE)


# Testing/Timing ------------------------------------------------------

debug(deaths_msm)
undebug(prevalence_msm)
debug(simnet_msm)
undebug(trans_msm)

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
