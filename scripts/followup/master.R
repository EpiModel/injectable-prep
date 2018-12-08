
## build master.sh script ##

library("EpiModelHPC")

# Table 1 -----------------------------------------------------------------

setwd("scripts/followup/")
vars <- list(PSP = c(0.2925, 0.10, 0.20, 0.40, 0.50),
             PPI = c(0, 0.25, 0.5, 0.75, 1))
sbatch_master(vars,
              master.file = "master.sh",
              build.runsim = TRUE,
              simno.start = 2000,
              ckpt = TRUE,
              narray = 7,
              ncores = 16,
              mem = "55G")

