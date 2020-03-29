source("R/utils-sim_calib_params.R")

burnin1_lgth <- 52 * 60
burnin2_lgth <- 0 #52 * 20

control <- control_msm(
  nsteps = burnin1_lgth + burnin2_lgth,
  nsims = 28,
  ncores = 28,
  save.nwstats = FALSE,
  save.clin.hist = FALSE,
  verbose = TRUE
)

param$prep.start = burnin1_lgth + 1
param$riskh.start = burnin1_lgth - 2 * 52

# tested values
trial_vals <- list()

trial_vals[["tt.full.supp"]] <- list(
  c(rep(0.526, 2), 0.566),
  c(rep(0.525, 2), 0.565)
)

trial_vals <- NULL


# Template part ----------------------------------------------------------------

source("R/utils-slurm_wf.R")
source("R/utils-slurm_sim_funs.R")

slurm_wf_tmpl_dir("inst/slurm_wf/", "slurm_wf", force = T)

shared_res <- list(
  partition = "ckpt", #"csde", #"ckpt",
  account = "csde-ckpt", #"csde", #"csde-ckpt",
  n_cpus = 28,
  memory = 4 * 1e3 # in Mb and PER CPU
)

jobs_grp <- 50 # Define number of jobs per grp
grps <- 1  # number of folders / params to test

seq_jobs <- rep(seq_len(jobs_grp),  grps)
seq_grps <- vapply(seq_len(grps), rep, times = jobs_grp, numeric(jobs_grp))
seq_grps <- as.vector(as.vector(seq_grps))

slurm_wf_Map(
  "slurm_wf",
  resources = c(shared_res, list(
    job_name = "sim_injec_aleguil",
    walltime = 60
  )),
  FUN = slurm_sim,
  batch = seq_jobs, grp_btch = seq_grps,
  MoreArgs = list(orig = orig, param = param, init = init, control = control,
                  trial_vals = trial_vals)
)


slurm_wf_do.call(
  "slurm_wf",
  resources = c(shared_res, list(
    job_name = "combine_injec_aleguil",
    walltime = 120,
    afterany = "sim_injec_aleguil"
  )),
  what = slurm_combine,
  args = list(sims_path = "slurm_wf/out", n_steps = 1.5 * burnin2_lgth ))
