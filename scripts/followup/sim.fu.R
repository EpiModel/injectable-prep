
## Packages
library("methods")
suppressMessages(library("EpiModelHIV"))

## Environmental Arguments
simno <- as.numeric(Sys.getenv("SIMNO"))
jobno <- as.numeric(Sys.getenv("PBS_ARRAYID"))
njobs <- as.numeric(Sys.getenv("NJOBS"))
fsimno <- paste(simno, jobno, sep = ".")

prep.aware.B <- as.numeric(Sys.getenv("AWAB"))
prep.aware.W <- as.numeric(Sys.getenv("AWAW"))
prep.access.B <- as.numeric(Sys.getenv("ACCB"))
prep.access.W <- as.numeric(Sys.getenv("ACCW"))
prep.rx.B <- as.numeric(Sys.getenv("RXB"))
prep.rx.W <- as.numeric(Sys.getenv("RXW"))
prep.hi.adr.B <- as.numeric(Sys.getenv("HIAB"))
prep.hi.adr.W <- as.numeric(Sys.getenv("HIAW"))
prep.dist.B <- as.numeric(Sys.getenv("DISB"))
prep.dist.W <- as.numeric(Sys.getenv("DISW"))

## Parameters
load("est/nwstats.prace.rda")

param <- param_msm(nwstats = st,
                   race.method = 2,
                   rgc.tprob = 0.428,
                   ugc.tprob = 0.350,
                   rct.tprob = 0.231,
                   uct.tprob = 0.205,
                   rgc.asympt.int = 205.8,
                   ugc.asympt.int = 205.8,
                   rct.asympt.int = 265.1,
                   uct.asympt.int = 265.1,
                   hiv.rgc.rr = 2.78,
                   hiv.ugc.rr = 1.73,
                   hiv.rct.rr = 2.78,
                   hiv.uct.rr = 1.73,
                   hiv.dual.rr = 0.2,

                   base.ai.main.BB.rate = 0.22,
                   base.ai.main.BW.rate = 0.22,
                   base.ai.main.WW.rate = 0.22,
                   base.ai.pers.BB.rate = 0.14,
                   base.ai.pers.BW.rate = 0.14,
                   base.ai.pers.WW.rate = 0.14,
                   ai.scale.BB = 1.31,
                   ai.scale.BW = 1,
                   ai.scale.WW = 0.77,

                   cond.eff = 0.95,
                   cond.fail.B = 0.39,
                   cond.fail.W = 0.21,

                   cond.main.BB.prob = 0.21,
                   cond.main.BW.prob = 0.21,
                   cond.main.WW.prob = 0.21,
                   cond.rr.BB = 0.71,
                   cond.rr.BW = 1,
                   cond.rr.WW = 1.6,

                   gc.sympt.prob.tx.B = 0.86,
                   gc.sympt.prob.tx.W = 0.96,
                   ct.sympt.prob.tx.B = 0.72,
                   ct.sympt.prob.tx.W = 0.85,
                   gc.asympt.prob.tx.B = 0.10,
                   gc.asympt.prob.tx.W = 0.19,
                   ct.asympt.prob.tx.B = 0.05,
                   ct.asympt.prob.tx.W = 0.10,

                   sti.cond.fail.B = 0.39,
                   sti.cond.fail.W = 0.21,

                   prep.start = 2601,

                   prep.aware.B = prep.aware.B, #0.50
                   prep.aware.W = prep.aware.W, #0.50
                   prep.access.B = prep.access.B, #0.76,
                   prep.access.W = prep.access.W, #0.95,
                   prep.rx.B = prep.rx.B, #0.63,
                   prep.rx.W = prep.rx.W, #0.73,
                   prep.adhr.dist.B = reallocate_pcp(reall = prep.hi.adr.B - 0.784), # 0.598
                   prep.adhr.dist.W = reallocate_pcp(reall = prep.hi.adr.W - 0.784), # 0.930
                   prep.class.hr = c(0.69, 0.19, 0.02),
                   prep.discont.rate.B = 1-(2^(-1/prep.dist.B)), # 406
                   prep.discont.rate.W = 1-(2^(-1/prep.dist.W)), # 1155

                   prep.tst.int = 90,
                   prep.risk.int = 182,
                   prep.risk.reassess.method = "year",

                   rcomp.prob = 0.41,
                   rcomp.adh.groups = 2:3,
                   rcomp.main.only = FALSE,
                   rcomp.discl.only = FALSE)

init <- init_msm(st)

control <- control_msm(simno = fsimno,
                       start = 2601,
                       nsteps = 3120,
                       nsims = 16,
                       ncores = 16,
                       initialize.FUN = reinit_msm,
                       verbose = FALSE)

## Simulation
netsim_hpc("est/pracemod.burnin.rda", param, init, control,
           compress = FALSE, verbose = FALSE)

process_simfiles(simno = simno, min.n = njobs,
                 outdir = "data/", compress = TRUE)
