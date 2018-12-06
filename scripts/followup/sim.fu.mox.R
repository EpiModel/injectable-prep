
## Packages
library("methods")
suppressMessages(library("EpiModelHIV"))

## Environmental Arguments
simno <- as.numeric(Sys.getenv("SIMNO"))
jobno <- as.numeric(Sys.getenv("SLURM_ARRAY_TASK_ID"))
njobs <- as.numeric(Sys.getenv("NJOBS"))
fsimno <- paste(simno, jobno, sep = ".")

psp <- as.numeric(Sys.getenv("PSP"))
ppi <- as.numeric(Sys.getenv("PPI"))

## Parameters
load("est/nwstats.rda")
param <- param_msm(nwstats = st,
                   race.method = 1,
                   riskh.start = 2500,

                   prep.start = 2601,
                   prep.la.start = 2861,

                   prep.start.prob = psp,
                   prep.prob.oral = 1 - ppi,

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
                   prep.sti.prob.tx = 1)
init <- init_msm(st)
control <- control_msm(simno = fsimno,
                       start = 2601,
                       nsteps = 3380,
                       nsims = 25,
                       ncores = 25,
                       initialize.FUN = reinit_msm,
                       verbose = FALSE)

## Simulation
netsim_hpc("est/lap.burnin.rda", param, init, control,
           compress = FALSE, verbose = FALSE)

process_simfiles(simno = simno, min.n = njobs,
                 outdir = "data/", compress = TRUE)
