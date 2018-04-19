
## build master.sh script ##

library("EpiModelHPC")

vars <- list(A=1)
qsub_master(simno.start = 1000,
            nsubjobs = 4,
            backfill = FALSE,
            vars = vars,
            append = FALSE,
            runsimfile = "runsim.burn.sh",
            outfile = "scripts/burnin/master.burn.sh")

