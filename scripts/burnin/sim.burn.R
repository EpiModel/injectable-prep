
## Packages
library("methods")
suppressMessages(library("EpiModelHIV"))

## Environmental Arguments
simno <- Sys.getenv("SIMNO")
jobno <- Sys.getenv("PBS_ARRAYID")
njobs <- as.numeric(Sys.getenv("NJOBS"))
fsimno <- paste(simno, jobno, sep = ".")

prep.timing.lnt <- as.logical(Sys.getenv("PLNT"))
prep.indics <- as.numeric(Sys.getenv("PIND"))


## Parameters
load("est/nwstats.rda")

param <- param_msm(nwstats = st,
                   prep.start = 10000,
                   prep.coverage = 0,
                   riskh.start = 1,
                   prep.timing.lnt = prep.timing.lnt,
                   prep.indics = prep.indics,
                   prep.sens.start = 30)
init <- init_msm(nwstats = st)
control <- control_msm(simno = fsimno,
                       nsteps = 5200,
                       nsims = 16,
                       ncores = 16,
                       verbose = FALSE)

## Simulation
netsim_hpc("est/fit.rda", param, init, control,
            save.min = TRUE, save.max = FALSE)

process_simfiles(simno = simno, min.n = njobs,
                 compress = TRUE, outdir = "data/")
