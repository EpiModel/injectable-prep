
## Packages
library("methods")
suppressMessages(library("EpiModelHIV"))

## Environmental Arguments
simno <- as.numeric(Sys.getenv("SIMNO"))
jobno <- as.numeric(Sys.getenv("PBS_ARRAYID"))
njobs <- as.numeric(Sys.getenv("NJOBS"))
fsimno <- paste(simno, jobno, sep = ".")

COVO <- as.numeric(Sys.getenv("COVO"))
COVL <- as.numeric(Sys.getenv("COVL"))
REPM <- Sys.getenv("REPM")

## Parameters
load("est/nwstats.rda")
param <- param_msm(nwstats = st,
                   race.method = 1,
                   riskh.start = 2500,

                   prep.start = 2601,                         ## fixed
                   prep.la.start = 2860,                      ## fixed

                   prep.coverage = COVO,                      ## mod1
                   prep.coverage.la = COVL,                   ## mod1
                   prep.replace.mod = REPM,                  ## mod1

                   prep.class.hr = c(0.69, 0.19, 0.02),       ## fixed
                   prep.adhr.dist = c(0.089, 0.127, 0.785),   ## fixed
                   prep.adhr.dist.la = c(0.215, 0.785),       ## mod3
                   prep.discont.rate = 1-(2^(-1/781)),        ## fixed

                   prep.hadr.int = 8 * 7,                     ## fixed
                   prep.ladr.int = 12 * 7,                    ## mod3

                   prepla.dlevel.icpt = 4.5,                  ## fixed, SA
                   prepla.dlevel.icpt.err = 2.5/3,            ## fixed, SA
                   prepla.dlevel.slope = 25,                  ## fixed, SA
                   prep.la.hr = c(0.15, 0.05, 0.02),          ## mod2
)
init <- init_msm(st)
control <- control_msm(simno = fsimno,
                       start = 2601,
                       nsteps = 3380,
                       nsims = 16,
                       ncores = 16,
                       initialize.FUN = reinit_msm,
                       verbose = FALSE)

## Simulation
netsim_hpc("est/lap.burnin.rda", param, init, control,
           compress = FALSE, verbose = FALSE)

process_simfiles(simno = simno, min.n = njobs,
                 outdir = "data/", compress = TRUE)
