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

  library(EpiModelHIV)
  out_dir <- paste0("slurm_wf/out/", SIMNO, "/")

  if (! file.exists(out_dir))
    dir.create(out_dir, recursive = TRUE)


  scenario_changer <- list(
    at = param$prep.la.start,
    params = list(
      prep.start.prob = param$prep.start.prob * PSP,
      prep.prob.oral = 1 - PPI,
      prepla.dlevel.icpt = PICPT,
      prepla.dlevel.halflife.int = PHALF,
      prep.la.hr.rel = RELHR,
      prep.adhr.dist.la = c(LOWP, 1 - LOWP),
      prepla.discont.rate = 1 - 2^(log2(1 - param$prep.discont.rate)/DCREL)
    )
  )

  param$param_updaters <- list()
  param$param_updaters[[1]] <- scenario_changer

  sim <- netsim(orig, param, init, control)

  sim <- truncate_sim(sim, 3380)
  sim$network <- NULL
  sim$attr <- NULL
  sim$temp <- NULL
  sim$el <- NULL
  sim$p <- NULL

  saveRDS(sim, paste0(out_dir, "sim", repl_num, ".rds"))
}

slurm_scenario_combine <- function(sims_path = "slurm_wf/", scenarios_no) {
  library(EpiModel)

  for (scen_no in scenarios_no) {
    sim_files <- paste0(sims_path, "/out/", scen_no, "/sim", rep(1:18), ".rds")

    for (i in seq_along(sim_files)) {
      sim <- readRDS(sim_files[[i]])
      if (i == 1) {
        out <- sim
      } else {
        out <- merge(out, sim, param.error = FALSE)
      }
    }

    saveRDS(out, paste0("slurm_wf/out/sim_", scen_no, ".rds"), compress = "xz")
  }
}

scenarios_params <- function(param, SIMNO, PSP, PPI, PICPT, PHALF, RELHR, LOWP,
                             DCREL) {
  prep.start.prob <-  param$prep.start.prob * PSP
  prep.prob.oral <- 1 - PPI
  prepla.dlevel.icpt <- PICPT
  prepla.dlevel.halflife.int <- PHALF
  prep.la.hr.rel <- RELHR
  prep.adhr.dist.la = c(LOWP, 1 - LOWP)
  prepla.discont.rate <- param$prep.discont.rate * DCREL

  data.frame(
    SIMNO = SIMNO,
    prep.start.prob = PSP,
    prep.prob.oral = 1 - PPI,
    prepla.dlevel.icpt = PICPT,
    prepla.dlevel.halflife.int = PHALF,
    prep.la.hr.rel = RELHR,
    prep.adhr.dist.la = paste(LOWP, " - ", 1 - LOWP),
    prepla.discont.rate = 1 - 2^(log2(1 - param$prep.discont.rate)/DCREL)
  )
}
