
## build master.sh script ##

library("EpiModelHPC")


# No PrEP Model -----------------------------------------------------------

vars <- list(PSP = 0,
             PPI = 0,
             PICPT = 3.59,
             PHALF = 35,
             RELHR = 1,
             LOWP = 0.215,
             DCREL = 1)
sbatch_master(vars,
              master.file = "scripts/followup/master.sh",
              build.runsim = TRUE,
              param.sheet = "scripts/followup/params.csv",
              param.tag = "NoPrEP",
              append = FALSE,
              simno.start = 100,
              ckpt = TRUE,
              nsims = 500,
              ncores = 28,
              mem = "100G")


# Calibrate PrEP Coverage -------------------------------------------------

vars <- list(PSP = seq(0.20, 0.22, 0.002),
             PPI = 0,
             PICPT = 3.59,
             PHALF = 35,
             RELHR = 1,
             LOWP = 0.215,
             DCREL = 1)
sbatch_master(vars,
              master.file = "scripts/followup/master.sh",
              build.runsim = TRUE,
              param.sheet = "scripts/followup/params.csv",
              param.tag = "CalibratePrEP",
              append = TRUE,
              simno.start = 600,
              ckpt = TRUE,
              nsims = 196,
              ncores = 28,
              mem = "100G")


# Table 1 -----------------------------------------------------------------

vars <- list(PSP = c(0.10, 0.21, 0.30, 0.40, 0.50),
             PPI = c(0, 0.25, 0.5, 0.75, 1),
             PICPT = 3.59,
             PHALF = 35,
             RELHR = 1,
             LOWP = 0.215,
             DCREL = 1)
sbatch_master(vars,
              master.file = "scripts/followup/master.sh",
              build.runsim = FALSE,
              param.sheet = "scripts/followup/params.csv",
              param.tag = "Table1",
              append = TRUE,
              simno.start = 2000,
              ckpt = TRUE,
              nsims = 500,
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
              master.file = "scripts/followup/master.sh",
              build.runsim = FALSE,
              param.sheet = "scripts/followup/params.csv",
              param.tag = "Figure1",
              append = TRUE,
              simno.start = 3000,
              ckpt = TRUE,
              nsims = 500,
              ncores = 28,
              mem = "100G")


# Figure 2 ----------------------------------------------------------------

vars <- list(PSP = 0.21,
             PPI = 0.50,
             PICPT = seq(1.5, 6.5, 0.5),
             PHALF = seq(15, 60, 5),
             RELHR = 1,
             LOWP = 0.215,
             DCREL = 1)
sbatch_master(vars,
              master.file = "scripts/followup/master.sh",
              build.runsim = FALSE,
              param.sheet = "scripts/followup/params.csv",
              param.tag = "Figure2",
              append = TRUE,
              simno.start = 4000,
              ckpt = TRUE,
              nsims = 500,
              ncores = 28,
              mem = "100G")



# Table 2 -----------------------------------------------------------------

vars <- list(PSP = 0.21,
             PPI = 0.50,
             PICPT = 3.59,
             PHALF = 35,
             RELHR = c(1/1.5, 1/1.25, 1/1.1, 1/1.05, 1.05, 1.1, 1.25, 1.5),
             LOWP = 0.215,
             DCREL = 1)
sbatch_master(vars,
              master.file = "scripts/followup/master.sh",
              build.runsim = FALSE,
              param.sheet = "scripts/followup/params.csv",
              param.tag = "Table2",
              append = TRUE,
              simno.start = 5000,
              ckpt = TRUE,
              nsims = 500,
              ncores = 28,
              mem = "100G")



# Table 3 -----------------------------------------------------------------

vars <- list(PSP = 0.21,
             PPI = 0.50,
             PICPT = 3.59,
             PHALF = 35,
             RELHR = 1,
             LOWP = c(0, 0.25, 0.50, 0.75, 100),
             DCREL = c(1.5, 2, 2.5, 3))
sbatch_master(vars,
              master.file = "scripts/followup/master.sh",
              build.runsim = FALSE,
              param.sheet = "scripts/followup/params.csv",
              param.tag = "Table3",
              append = TRUE,
              simno.start = 6000,
              ckpt = TRUE,
              nsims = 500,
              ncores = 28,
              mem = "100G")
