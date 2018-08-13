
## build master.sh script ##

library("EpiModelHPC")

system("scp scripts/followup/*.fu.[Rs]* hyak:/suppscr/csde/sjenness/lap/")


# Table 1 -----------------------------------------------------------------

# Reference
vars <- list(COVO = 0.15,
             COVL = 0)
qsub_master(simno.start = 2000,
            nsubjobs = 16,
            backfill = FALSE,
            vars = vars,
            append = FALSE,
            runsimfile = "runsim.fu.sh",
            outfile = "scripts/followup/master.fu.sh")

# supplementation
vars <- list(COVO = 0.15,
             COVL = seq(0.05, 0.5, 0.05))
qsub_master(simno.start = "auto",
            nsubjobs = 16,
            backfill = FALSE,
            vars = vars,
            append = TRUE,
            runsimfile = "runsim.fu.sh",
            outfile = "scripts/followup/master.fu.sh")

# replace all
vars <- list(COVO = 0.15,
             COVL = c(0.25, 0.5, 0.75, 1),
             REPM = "curr.oral")
qsub_master(simno.start = 2020,
            nsubjobs = 16,
            backfill = FALSE,
            vars = vars,
            append = TRUE,
            runsimfile = "runsim.fu.sh",
            outfile = "scripts/followup/master.fu.sh")

# replace low adherence users
vars <- list(COVO = 0.15,
             COVL = c(0.25, 0.5, 0.75, 1),
             REPM = "curr.oral.ladhr")
qsub_master(simno.start = 2030,
            nsubjobs = 16,
            backfill = FALSE,
            vars = vars,
            append = TRUE,
            runsimfile = "runsim.fu.sh",
            outfile = "scripts/followup/master.fu.sh")




# Table 3 -----------------------------------------------------------------

COVO <- as.numeric(Sys.getenv("COVO"))
COVL <- as.numeric(Sys.getenv("COVL"))
REPM <- Sys.getenv("REPM")
LADRT <- as.numeric(Sys.getenv("LADRT"))
HADRP <- as.numeric(Sys.getenv("HADRP"))

# supplementation
vars <- list(COVO = 0.15,
             COVL = 0.15,
             REPM = "all",
             LADRT = c(10, 14, 16),
             HADRP = c(0, 0.25, 0.5, 0.75, 1))
qsub_master(simno.start = 2040,
            nsubjobs = 16,
            backfill = FALSE,
            vars = vars,
            append = TRUE,
            runsimfile = "runsim.fu.sh",
            outfile = "scripts/followup/master.fu.sh")
