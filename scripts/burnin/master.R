
## build master.sh script ##

library("EpiModelHPC")

vars <- NULL
sbatch_master(vars,
              master.file = "scripts/burnin/master.sh",
              append = FALSE,
              simno.start = 1000,
              ckpt = FALSE,
              nsims = 112,
              ncores = 28,
              mem = "100G")
