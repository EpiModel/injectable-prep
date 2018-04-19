
## Packages
library("methods")
devtools::load_all("~/Dropbox/Dev/EpiModelHIV/EpiModelHIV")
suppressMessages(library("EpiModelHIV"))

load("est/nwstats.rda")

param <- param_msm(ai.scale.BB = 1.0734,
                   ai.scale.BW = 1.0734,
                   ai.scale.WW = 1.0734,

                   rgc.tprob = 0.3950,
                   ugc.tprob = 0.2859,
                   rct.tprob = 0.2295,
                   uct.tprob = 0.1937,

                   rgc.ntx.int = 241.5142,
                   ugc.ntx.int = 241.5142,
                   rct.ntx.int = 304.5330,
                   uct.ntx.int = 304.5330,

                   hiv.rgc.rr = 2.7525,
                   hiv.ugc.rr = 1.7204,
                   hiv.rct.rr = 2.7525,
                   hiv.uct.rr = 1.7204,

                   nwstats = st,
                   race.method = 1,
                   riskh.start = 2500,
                   prep.start = Inf,
                   prep.la.start = Inf,
                   prep.replace.mod = "all",
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
                   rcomp.discl.only = FALSE,

                   rgc.sympt.prob = 0.16,
                   ugc.sympt.prob = 0.90,
                   rct.sympt.prob = 0.14,
                   uct.sympt.prob = 0.58,
                   gc.sympt.prob.tx.B = 0.85,
                   gc.sympt.prob.tx.W = 0.85,
                   ct.sympt.prob.tx.B = 0.90,
                   ct.sympt.prob.tx.W = 0.90,
                   gc.asympt.prob.tx.B = 0.10,
                   gc.asympt.prob.tx.W = 0.10,
                   ct.asympt.prob.tx.B = 0.15,
                   ct.asympt.prob.tx.W = 0.15)

init <- init_msm(nwstats = st,
                 prev.B = 0.253,
                 prev.W = 0.253,
                 prev.ugc = 0.01,
                 prev.rgc = 0.01,
                 prev.uct = 0.01,
                 prev.rct = 0.01)
control <- control_msm(simno = 1,
                       nsteps = 52*20,
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


load("est/fit.rda")
sim <- netsim(est, param, init, control)

df <- as.data.frame(sim)
names(df)

plot(sim, y = "i.prev")
plot(sim, y = "gc")
