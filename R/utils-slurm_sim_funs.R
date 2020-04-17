slurm_sim <- function(orig, param, init, control, batch,
         grp_btch = 0, trial_vals = NULL, trial_updaters = NULL) {

  library(EpiModelHIV)

  out_dir <- "slurm_wf/out/"

  if (! file.exists(paste0(out_dir, grp_btch)))
    dir.create(paste0(out_dir, grp_btch), recursive = TRUE)

  if (!is.null(trial_vals) && length(trial_vals) > 0)
    param[names(trial_vals)] <- lapply(trial_vals, function(x) x[[grp_btch]])

  if (!is.null(trial_updaters) && length(trial_updaters) > 0)
    param$param_updaters <- list(trial_updaters[[grp_btch]])

  sim <- netsim(orig, param, init, control)
  saveRDS(sim, paste0(out_dir, "/", grp_btch, "/sim", batch, ".rds"))
}

slurm_combine <- function(sims_path = "slurm_wf/out", n_steps = 1) {
  library(data.table)
  library(fs)
  source("R/utils-sim_choice.R")

  # Merge all simulations
  df_name <- paste0(sims_path, "/big_sim.rds")

  library(future.apply)
  plan(multiprocess) # requires a lot of ram (~400 files)

  df <- create_big_sim_df(sims_path, n_steps = n_steps)
  saveRDS(df, df_name, compress = TRUE)
}

slurm_injec_scenario <- function(orig, param, init, control, n_steps = 52,
                                 SIMNO, PSP, PPI, PICPT, PHALF, RELHR, LOWP,
                                 DCREL, repl_num) {

  param$prep.start.prob <- PSP
  param$prep.prob.oral <- 1 - PPI
  param$prepla.dlevel.icpt <- PICPT
  param$prepla.dlevel.halflife.int <- PHALF

  param$prep.la.hr.rel <- RELHR
  param$prep.adhr.dist.la = c(LOWP, 1 - LOWP)
  param$prepla.discont.rate <- param$prep.discont.rate * DCREL

  sim <- netsim(orig, param, init, control)

  library(data.table)
  library(fs)

  out_dir <- paste0("slurm_wf/out/", SIMNO, "/")
  if (! file.exists(out_dir))
    dir.create(out_dir, recursive = TRUE)

  dt <- as.data.table(sim)
  dt <- dt[, .SD[(.N - n_steps + 1):.N] , by = "sim"
     ][, c("sim_id", "param_grp") :=
           .(paste0(..repl_num, "--", sim), SIMNO)][]

  saveRDS(dt, paste0(out_dir, "sim", repl_num, ".rds"))

}

slurm_scenario_combine <- function(sims_path = "slurm_wf/out") {
  library(data.table)
  library(fs)
  library(future.apply)
  plan(multiprocess)

  rdss <- dir_ls(sims_path, regexp = "[.]rds$", recurse = TRUE)
  dts <- future_lapply(rdss, readRDS)

  out <- rbindlist(dts)

  saveRDS(out, paste0(sims_path, "/scenarios_out.rds"))
  file_delete(rdss)
}
