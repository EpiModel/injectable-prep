
## Packages
library("methods")
suppressMessages(library("EpiModelHIV"))

## Environmental Arguments
simno <- as.numeric(Sys.getenv("SIMNO"))
jobno <- as.numeric(Sys.getenv("SLURM_ARRAY_TASK_ID"))
njobs <- as.numeric(Sys.getenv("NJOBS"))
fsimno <- paste(simno, jobno, sep = ".")

load("est/nwstats.rda")

param <- param_msm(nwstats = st,
                   race.method = 1,
                   riskh.start = 2500,
                   prep.start = Inf,
                   prep.la.start = Inf,
                   prep.start.prob = 0.2925,
                   prep.prob.oral = 1,
                   prep.adhr.dist = c(0.089, 0.127, 0.785),
                   prep.adhr.hr = c(0.69, 0.19, 0.02),
                   prep.discont.rate = 1 - (2^(-1/781)),
                   prepla.discont.rate = 1 - (2^(-1/781)),
                   prep.inj.int = 8 * 7,
                   prep.adhr.dist.la = c(0.215, 0.785),
                   prepla.dlevel.icpt = 3.98,
                   prepla.dlevel.icpt.err = 2,
                   prepla.dlevel.halflife.int = 40,
                   prep.la.hr.beta = -9.0599,
                   prep.la.hr.rel = 1,
                   prep.tst.int = 90,
                   prep.risk.int = 182,
                   prep.risk.reassess.method = "year",
                   prep.sti.screen.int = 182,
                   prep.la.sti.screen.int = 121,
                   prep.sti.prob.tx = 1,

                   ai.scale.BB = 1,
                   ai.scale.BW = 1,
                   ai.scale.WW = 1,

                   rgc.tprob = 0.3572,
                   ugc.tprob = 0.2860,
                   rct.tprob = 0.2220,
                   uct.tprob = 0.1819,

                   rgc.ntx.int = 180.14,
                   ugc.ntx.int = 180.14,
                   rct.ntx.int = 270.59,
                   uct.ntx.int = 270.59,

                   hiv.rgc.rr = 2.1,
                   hiv.ugc.rr = 1.3,
                   hiv.rct.rr = 2.1,
                   hiv.uct.rr = 1.3,

                   rgc.sympt.prob = 0.16,
                   ugc.sympt.prob = 0.90,
                   rct.sympt.prob = 0.16,
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
                 prev.ugc = 0.005,
                 prev.rgc = 0.005,
                 prev.uct = 0.013,
                 prev.rct = 0.013)
control <- control_msm(simno = fsimno,
                       nsteps = 52*25,
                       nsims = 16,
                       ncores = 16,
                       save.nwstats = TRUE,
                       verbose = FALSE)

## Simulation
netsim_hpc("est/fit.rda", param, init, control,
            save.min = TRUE, save.max = FALSE)

process_simfiles(simno = simno, min.n = njobs, compress = TRUE, outdir = "data/")
