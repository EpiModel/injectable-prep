
## build master.sh script ##

library("EpiModelHPC")

vars <- list(PLNT = TRUE,
             PIND = 1:5)
qsub_master(simno.start = 1000,
            nsubjobs = 7,
            backfill = FALSE,
            vars = vars,
            append = FALSE,
            runsimfile = "runsim.burn.sh",
            outfile = "scripts/burnin/master.burn.sh")

