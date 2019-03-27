
## Packages
library("methods")
suppressMessages(library("EpiModelHIV"))

## Environmental Arguments
pull_env_vars()

load("est/nwstats.rda")
param <- param_msm(nwstats = st)
init <- init_msm(nwstats = st,
                 prev.B = 0.253,
                 prev.W = 0.253,
                 prev.ugc = 0.005,
                 prev.rgc = 0.005,
                 prev.uct = 0.013,
                 prev.rct = 0.013)
control <- control_msm(simno = fsimno,
                       nsteps = 52*50,
                       nsims = ncores,
                       ncores = ncores,
                       save.nwstats = TRUE,
                       verbose = FALSE)

## Simulation
netsim_hpc("est/fit.rda", param, init, control,
            save.min = TRUE, save.max = FALSE, verbose = FALSE)

process_simfiles(simno = simno, min.n = njobs, nsims = nsims)
