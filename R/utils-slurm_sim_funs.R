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
