lnt <- FALSE # if FALSE: set `require.lnt` to FALSE and adjust ` prep.start.prob`
source("R/utils-sim_calib_params.R")

burnin1_lgth <- 52 * 60
burnin2_lgth <- 52 * 5

control <- control_msm(
  nsteps = burnin1_lgth + burnin2_lgth,
  nsims = 28,
  ncores = 28,
  save.nwstats = FALSE,
  save.clin.hist = FALSE,
  verbose = TRUE
)

param$prep.start = burnin1_lgth + 1
param$riskh.start = burnin1_lgth - 1 * 52

# tested values
trial_vals <- list()

trial_vals[["prep.start.prob"]] <- list(
   0.71,
   0.71
)

## set to NULL if no modifications is to be made to the parameters
trial_vals <- NULL

n_repl <- 30 # number of replications per groups

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

grps <- max(1, length(trial_vals[[1]]))  # number of folders / params to test

seq_jobs <- rep(seq_len(n_repl),  grps)
seq_grps <- vapply(seq_len(grps), rep, times = n_repl, numeric(n_repl))
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
