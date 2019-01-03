
## Packages
library("methods")
suppressMessages(library("EpiModelHIV"))

## Environmental Arguments
pull_env_vars(num.vars = c("PSP", "PPI", "PICPT", "PHALF",
                           "RELHR", "LOWP", "DCREL"))

## Parameters
load("est/nwstats.rda")
param <- param_msm(nwstats = st,
                   race.method = 1,
                   riskh.start = 2500,

                   prep.start = 2601,
                   prep.la.start = 2861,

                   prep.start.prob = PSP, # 0.104
                   prep.prob.oral = 1 - PPI, # 0.5

                   prep.adhr.dist = c(0.089, 0.127, 0.785),
                   prep.adhr.hr = c(0.69, 0.19, 0.02),

                   prep.discont.rate = 1 - (2^(-1/(224.4237))),
                   prepla.discont.rate = 1 - (2^(-1/(224.4237*DCREL))), # 1

                   prep.inj.int = 8 * 7,

                   prep.adhr.dist.la = c(LOWP, 1-LOWP), # c(0.215, 0.785)
                   prepla.dlevel.icpt = PICPT, # 3.59
                   prepla.dlevel.icpt.err = 2,
                   prepla.dlevel.halflife.int = PHALF, # 35
                   prep.la.hr.beta = -9.0599,
                   prep.la.hr.rel = RELHR, #1

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
                       nsims = ncores,
                       ncores = ncores,
                       initialize.FUN = reinit_msm,
                       verbose = FALSE)

## Simulation
netsim_hpc("est/lap.burnin.rda", param, init, control,
           compress = FALSE, verbose = FALSE)

process_simfiles(simno = simno, min.n = njobs, nsims = nsims, truncate.at = 2600)
