
## build master.sh script ##

library("EpiModelHPC")

# system("scp scripts/followup/*.[Rs]* hyak:/gscratch/csde/sjenness/sti/")


# Table 1/2 -----------------------------------------------------------------

# Reference
vars <- list(AWAB = 0.50,
             AWAW = 0.50,
             ACCB = 0.76,
             ACCW = 0.95,
             RXB = 0, # 0.63
             RXW = 0, # 0.73
             HIAB = 0.598,
             HIAW = 0.930,
             DISB = 406,
             DISW = 1155)
qsub_master(simno.start = 2000,
            nsubjobs = 16,
            backfill = FALSE,
            vars = vars,
            append = FALSE,
            runsimfile = "runsim.fu.sh",
            outfile = "scripts/followup/master.fu.sh")

# Observed B
vars <- list(AWAB = 0.50,
             AWAW = 0.50,
             ACCB = 0.76,
             ACCW = 0.95,
             RXB = 0.63,
             RXW = 0.73,
             HIAB = 0.598,
             HIAW = 0.930,
             DISB = 406,
             DISW = 1155)
qsub_master(simno.start = "auto",
            nsubjobs = 16,
            backfill = FALSE,
            vars = vars,
            append = TRUE,
            runsimfile = "runsim.fu.sh",
            outfile = "scripts/followup/master.fu.sh")

# Awareness
vars <- list(AWAB = c(0.3, 0.7, 0.9),
             AWAW = 0.50,
             ACCB = 0.76,
             ACCW = 0.95,
             RXB = 0.63,
             RXW = 0.73,
             HIAB = 0.598,
             HIAW = 0.930,
             DISB = 406,
             DISW = 1155)
qsub_master(simno.start = "auto",
            nsubjobs = 16,
            backfill = FALSE,
            vars = vars,
            append = TRUE,
            runsimfile = "runsim.fu.sh",
            outfile = "scripts/followup/master.fu.sh")

# Access
vars <- list(AWAB = 0.5,
             AWAW = 0.50,
             ACCB = c(0.5, 0.85, 0.95),
             ACCW = 0.95,
             RXB = 0.63,
             RXW = 0.73,
             HIAB = 0.598,
             HIAW = 0.930,
             DISB = 406,
             DISW = 1155)
qsub_master(simno.start = "auto",
            nsubjobs = 16,
            backfill = FALSE,
            vars = vars,
            append = TRUE,
            runsimfile = "runsim.fu.sh",
            outfile = "scripts/followup/master.fu.sh")

# Prescription
vars <- list(AWAB = 0.50,
             AWAW = 0.50,
             ACCB = 0.76,
             ACCW = 0.95,
             RXB = c(0.50, 0.73, 0.85),
             RXW = 0.73,
             HIAB = 0.598,
             HIAW = 0.930,
             DISB = 406,
             DISW = 1155)
qsub_master(simno.start = "auto",
            nsubjobs = 16,
            backfill = FALSE,
            vars = vars,
            append = TRUE,
            runsimfile = "runsim.fu.sh",
            outfile = "scripts/followup/master.fu.sh")

# Adherence
vars <- list(AWAB = 0.50,
             AWAW = 0.50,
             ACCB = 0.76,
             ACCW = 0.95,
             RXB = 0.63,
             RXW = 0.73,
             HIAB = c(0.5, 0.75, 0.93),
             HIAW = 0.930,
             DISB = 406,
             DISW = 1155)
qsub_master(simno.start = "auto",
            nsubjobs = 16,
            backfill = FALSE,
            vars = vars,
            append = TRUE,
            runsimfile = "runsim.fu.sh",
            outfile = "scripts/followup/master.fu.sh")

# Discontinuation
vars <- list(AWAB = 0.50,
             AWAW = 0.50,
             ACCB = 0.76,
             ACCW = 0.95,
             RXB = 0.63,
             RXW = 0.73,
             HIAB = 0.598,
             HIAW = 0.930,
             DISB = c(365, 720, 1155),
             DISW = 1155)
qsub_master(simno.start = "auto",
            nsubjobs = 16,
            backfill = FALSE,
            vars = vars,
            append = TRUE,
            runsimfile = "runsim.fu.sh",
            outfile = "scripts/followup/master.fu.sh")

# Joint: Observed W
vars <- list(AWAB = 0.50,
             AWAW = 0.50,
             ACCB = 0.95,
             ACCW = 0.95,
             RXB = 0.73,
             RXW = 0.73,
             HIAB = 0.930,
             HIAW = 0.930,
             DISB = 1155,
             DISW = 1155)
qsub_master(simno.start = "auto",
            nsubjobs = 16,
            backfill = FALSE,
            vars = vars,
            append = TRUE,
            runsimfile = "runsim.fu.sh",
            outfile = "scripts/followup/master.fu.sh")

# Joint ranges
vars <- list(AWAB = 0.50 * 0.5,
             AWAW = 0.50,
             ACCB = 0.76 * 0.5,
             ACCW = 0.95,
             RXB = 0.63 * 0.5,
             RXW = 0.73,
             HIAB = 0.598 * 0.5,
             HIAW = 0.930,
             DISB = 406 * 0.5,
             DISW = 1155)
qsub_master(simno.start = "auto",
            nsubjobs = 16,
            backfill = FALSE,
            vars = vars,
            append = TRUE,
            runsimfile = "runsim.fu.sh",
            outfile = "scripts/followup/master.fu.sh")

vars <- list(AWAB = 0.50 * 0.6,
             AWAW = 0.50,
             ACCB = 0.76 * 0.6,
             ACCW = 0.95,
             RXB = 0.63 * 0.6,
             RXW = 0.73,
             HIAB = 0.598 * 0.6,
             HIAW = 0.930,
             DISB = 406 * 0.6,
             DISW = 1155)
qsub_master(simno.start = "auto",
            nsubjobs = 16,
            backfill = FALSE,
            vars = vars,
            append = TRUE,
            runsimfile = "runsim.fu.sh",
            outfile = "scripts/followup/master.fu.sh")

vars <- list(AWAB = 0.50 * 0.7,
             AWAW = 0.50,
             ACCB = 0.76 * 0.7,
             ACCW = 0.95,
             RXB = 0.63 * 0.7,
             RXW = 0.73,
             HIAB = 0.598 * 0.7,
             HIAW = 0.930,
             DISB = 406 * 0.7,
             DISW = 1155)
qsub_master(simno.start = "auto",
            nsubjobs = 16,
            backfill = FALSE,
            vars = vars,
            append = TRUE,
            runsimfile = "runsim.fu.sh",
            outfile = "scripts/followup/master.fu.sh")

vars <- list(AWAB = 0.50 * 0.8,
             AWAW = 0.50,
             ACCB = 0.76 * 0.8,
             ACCW = 0.95,
             RXB = 0.63 * 0.8,
             RXW = 0.73,
             HIAB = 0.598 * 0.8,
             HIAW = 0.930,
             DISB = 406 * 0.8,
             DISW = 1155)
qsub_master(simno.start = "auto",
            nsubjobs = 16,
            backfill = FALSE,
            vars = vars,
            append = TRUE,
            runsimfile = "runsim.fu.sh",
            outfile = "scripts/followup/master.fu.sh")

vars <- list(AWAB = 0.50 * 0.9,
             AWAW = 0.50,
             ACCB = 0.76 * 0.9,
             ACCW = 0.95,
             RXB = 0.63 * 0.9,
             RXW = 0.73,
             HIAB = 0.598 * 0.9,
             HIAW = 0.930,
             DISB = 406 * 0.9,
             DISW = 1155)
qsub_master(simno.start = "auto",
            nsubjobs = 16,
            backfill = FALSE,
            vars = vars,
            append = TRUE,
            runsimfile = "runsim.fu.sh",
            outfile = "scripts/followup/master.fu.sh")

vars <- list(AWAB = 0.50 * 1.1,
             AWAW = 0.50,
             ACCB = 1,
             ACCW = 0.95,
             RXB = 0.73 * 1.1,
             RXW = 0.73,
             HIAB = 1,
             HIAW = 0.930,
             DISB = 1155 * 1.1,
             DISW = 1155)
qsub_master(simno.start = "auto",
            nsubjobs = 16,
            backfill = FALSE,
            vars = vars,
            append = TRUE,
            runsimfile = "runsim.fu.sh",
            outfile = "scripts/followup/master.fu.sh")

vars <- list(AWAB = 0.50 * 1.2,
             AWAW = 0.50,
             ACCB = 1,
             ACCW = 0.95,
             RXB = 0.73 * 1.2,
             RXW = 0.73,
             HIAB = 1,
             HIAW = 0.930,
             DISB = 1155 * 1.2,
             DISW = 1155)
qsub_master(simno.start = "auto",
            nsubjobs = 16,
            backfill = FALSE,
            vars = vars,
            append = TRUE,
            runsimfile = "runsim.fu.sh",
            outfile = "scripts/followup/master.fu.sh")

vars <- list(AWAB = 0.50 * 1.3,
             AWAW = 0.50,
             ACCB = 1,
             ACCW = 0.95,
             RXB = 0.73 * 1.3,
             RXW = 0.73,
             HIAB = 1,
             HIAW = 0.930,
             DISB = 1155 * 1.3,
             DISW = 1155)
qsub_master(simno.start = "auto",
            nsubjobs = 16,
            backfill = FALSE,
            vars = vars,
            append = TRUE,
            runsimfile = "runsim.fu.sh",
            outfile = "scripts/followup/master.fu.sh")

vars <- list(AWAB = 0.50 * 1.4,
             AWAW = 0.50,
             ACCB = 1,
             ACCW = 0.95,
             RXB = 1,
             RXW = 0.73,
             HIAB = 1,
             HIAW = 0.930,
             DISB = 1155 * 1.4,
             DISW = 1155)
qsub_master(simno.start = "auto",
            nsubjobs = 16,
            backfill = FALSE,
            vars = vars,
            append = TRUE,
            runsimfile = "runsim.fu.sh",
            outfile = "scripts/followup/master.fu.sh")

vars <- list(AWAB = 0.50 * 1.5,
             AWAW = 0.50,
             ACCB = 1,
             ACCW = 0.95,
             RXB = 1,
             RXW = 0.73,
             HIAB = 1,
             HIAW = 0.930,
             DISB = 1155 * 1.5,
             DISW = 1155)
qsub_master(simno.start = "auto",
            nsubjobs = 16,
            backfill = TRUE,
            vars = vars,
            append = TRUE,
            runsimfile = "runsim.fu.sh",
            outfile = "scripts/followup/master.fu.sh")



# Figure 1/2 ----------------------------------------------------------------

vals <- seq(0.5, 2, 0.05)
for (i in seq_along(vals)) {

  vars <- list(AWAB = min(0.50 * vals[i], 1),
               AWAW = 0.50,
               ACCB = min(0.76 * vals[i], 1),
               ACCW = 0.95,
               RXB = min(0.63 * vals[i], 1),
               RXW = 0.73,
               HIAB = min(0.598 * vals[i], 1),
               HIAW = 0.930,
               DISB = 406 * vals[i],
               DISW = 1155)
  qsub_master(simno.start = "auto",
              nsubjobs = 16,
              backfill = TRUE,
              vars = vars,
              append = TRUE,
              runsimfile = "runsim.fu.sh",
              outfile = "scripts/followup/master.fu.sh")

}


# Figure 3 ----------------------------------------------------------------

vals <- seq(0.5, 2, 0.1)
for (i in seq_along(vals)) {
  for (j in seq_along(vals)) {
    vars <- list(AWAB = min(0.50 * vals[i], 1),
                 AWAW = 0.50,
                 ACCB = min(0.76 * vals[i], 1),
                 ACCW = 0.95,
                 RXB = min(0.63 * vals[i], 1),
                 RXW = 0.73,
                 HIAB = min(0.598 * vals[j], 1),
                 HIAW = 0.930,
                 DISB = 406 * vals[j],
                 DISW = 1155)
    qsub_master(simno.start = "auto",
                nsubjobs = 7,
                backfill = TRUE,
                vars = vars,
                append = TRUE,
                runsimfile = "runsim.fu.sh",
                outfile = "scripts/followup/master.fu.sh")
  }
}
