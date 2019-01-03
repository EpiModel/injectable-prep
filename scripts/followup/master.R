
## build master.sh script ##

library("EpiModelHPC")


# Calibrate PrEP Coverage -------------------------------------------------

setwd("scripts/followup/")
vars <- list(PSP = c(0.1, 0.102, 0.104, 0.106, 0.108),
             PPI = 0,
             PICPT = 3.59,
             PHALF = 35,
             RELHR = 1,
             LOWP = 0.215,
             DCREL = 1)
sbatch_master(vars,
              master.file = "master.sh",
              build.runsim = TRUE,
              param.sheet = "params.csv",
              param.tag = "Calibrate",
              append = FALSE,
              simno.start = 1000,
              ckpt = TRUE,
              nsims = 100,
              ncores = 25,
              mem = "100G")


# Table 1 -----------------------------------------------------------------

vars <- list(PSP = c(0.104, 0.20, 0.40, 0.50),
             PPI = c(0, 0.25, 0.5, 0.75, 1),
             PICPT = 3.59,
             PHALF = 35,
             RELHR = 1,
             LOWP = 0.215,
             DCREL = 1)
sbatch_master(vars,
              master.file = "master.sh",
              build.runsim = FALSE,
              param.sheet = "params.csv",
              param.tag = "Table1",
              append = TRUE,
              simno.start = 2000,
              ckpt = TRUE,
              nsims = 250,
              ncores = 28,
              mem = "100G")


# Figure 1 ----------------------------------------------------------------

vars <- list(PSP = seq(0, 1, 0.1),
             PPI = seq(0, 1, 0.1),
             PICPT = 3.59,
             PHALF = 35,
             RELHR = 1,
             LOWP = 0.215,
             DCREL = 1)
sbatch_master(vars,
              master.file = "master.sh",
              build.runsim = FALSE,
              param.sheet = "params.csv",
              param.tag = "Figure1",
              append = TRUE,
              simno.start = 3000,
              ckpt = TRUE,
              nsims = 250,
              ncores = 28,
              mem = "100G")


# Figure 2 ----------------------------------------------------------------

vars <- list(PSP = 0.104,
             PPI = 0.50,
             PICPT = seq(1.5, 6.5, 0.5),
             PHALF = seq(15, 60, 5),
             RELHR = 1,
             LOWP = 0.215,
             DCREL = 1)
sbatch_master(vars,
              master.file = "master.sh",
              build.runsim = FALSE,
              param.sheet = "params.csv",
              param.tag = "Figure2",
              append = TRUE,
              simno.start = 4000,
              ckpt = TRUE,
              nsims = 250,
              ncores = 28,
              mem = "100G")



# Table 2 -----------------------------------------------------------------

vars <- list(PSP = 0.104,
             PPI = 0.50,
             PICPT = 3.59,
             PHALF = 35,
             RELHR = c(1/1.5, 1/1.25, 1/1.1, 1/1.05, 1.05, 1.1, 1.25, 1.5),
             LOWP = 0.215,
             DCREL = 1)
sbatch_master(vars,
              master.file = "master.sh",
              build.runsim = FALSE,
              param.sheet = "params.csv",
              param.tag = "Table2",
              append = TRUE,
              simno.start = 5000,
              ckpt = TRUE,
              nsims = 250,
              ncores = 28,
              mem = "100G")



# Table 3 -----------------------------------------------------------------

vars <- list(PSP = 0.104,
             PPI = 0.50,
             PICPT = 3.59,
             PHALF = 35,
             RELHR = 1,
             LOWP = c(0, 0.25, 0.50, 0.75, 100),
             DCREL = c(1.5, 2, 2.5, 3))
sbatch_master(vars,
              master.file = "master.sh",
              build.runsim = FALSE,
              param.sheet = "params.csv",
              param.tag = "Table3",
              append = TRUE,
              simno.start = 6000,
              ckpt = TRUE,
              nsims = 250,
              ncores = 28,
              mem = "100G")
