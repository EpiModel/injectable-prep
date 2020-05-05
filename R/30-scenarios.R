library(EpiModelHIV)
## devtools::load_all("EpiModelHIV-p/")
library(readxl)
source("R/utils-slurm_sim_funs.R")

n_repl <- 3 # number of replication per scenarios (time 28)
n_years_burnin <- 5 # number of years before la.prep
n_years_scenario <- 10 # number of years to simulate the scenario periode
n_years_output <- 15  # number of years to keep as output

shared_res <- list(
  partition = "ckpt", #"csde", #"ckpt",
  account = "csde-ckpt", #"csde", #"csde-ckpt",
  n_cpus = 28,
  memory = 5 * 1e3 # in Mb and PER CPU
)


### Template part ----------------------------------------------------------------
source("R/utils-slurm_wf.R")

## Sim preparation
orig <- readRDS("out/est/restart_base.rds")
netstats <- readRDS("out/est/netstats.rds")
epistats <- readRDS("out/est/epistats.rds")

init <- init_msm(
  prev.ugc = 0,
  prev.rct = 0,
  prev.rgc = 0,
  prev.uct = 0
)

n_years <- n_years_burnin + n_years_scenario

control <- control_msm(
  start = orig$control$nsteps + 1,
  nsteps = orig$control$nsteps + 52 * n_years,
  nsims = shared_res$n_cpus,
  ncores = shared_res$n_cpus,
  initialize.FUN = reinit_msm,
  save.nwstats = FALSE,
  save.clin.hist = FALSE,
  verbose = FALSE
)

param <- orig$param
param$prep.start <- control$start
param$riskh.start <- param$prep.start - 52
param$prep.la.start <- control$start + n_years_burnin * 52
param$prep.require.lnt <- FALSE
param$prep.start.prob <- 0.00411
param$prep.inj.int <- 8

# Scenarios preparation --------------------------------------------------------
## Read scenarios excel
df_scenarios <- read_excel("out/est/params_new.xlsx")

## Put the char cols to numeric
chr_cols <- c("PHALF", "RELHR", "DCREL")
df_scenarios[, chr_cols] <- lapply(df_scenarios[, chr_cols], function(x) {
  vapply(x, function(y) eval(parse(text = y)), numeric(1))
})

## Template preparation
slurm_wf_tmpl_dir("inst/slurm_wf/", "slurm_wf", force = T)

## Prepare arguments to slurm_wf_Map
repl_nums <- rep(seq_len(n_repl), nrow(df_scenarios))

slurm_wf_Map(
  "slurm_wf",
  resources = c(shared_res, list(
    job_name = "scenarios_injec",
    walltime = 15
  )),
  FUN = slurm_injec_scenario,
  SIMNO = rep(df_scenarios$SIMNO, each = n_repl),
  PSP = rep(df_scenarios$PSP, each = n_repl),
  PPI = rep(df_scenarios$PPI, each = n_repl),
  PICPT = rep(df_scenarios$PICPT, each = n_repl),
  PHALF = rep(df_scenarios$PHALF, each = n_repl),
  RELHR = rep(df_scenarios$RELHR, each = n_repl),
  LOWP = rep(df_scenarios$LOWP, each = n_repl),
  DCREL = rep(df_scenarios$DCREL, each = n_repl),
  repl_num = repl_nums,
  MoreArgs = list(orig = orig, param = param, init = init, control = control,
                  n_steps = n_years_output * 52)
)

slurm_wf_do.call(
  "slurm_wf",
  resources = c(shared_res, list(
    job_name = "combine_injec ",
    ## afterany = "scenarios_injec",
    walltime = 15
  )),
  what = slurm_scenario_combine,
  args = list(
    sims_path = "slurm_wf_raw",
    scenarios_no = df_scenarios$SIMNO)
)

params_lst <- Map(
  f = scenarios_params,
  SIMNO = df_scenarios$SIMNO,
  PSP = df_scenarios$PSP,
  PPI = df_scenarios$PPI,
  PICPT = df_scenarios$PICPT,
  PHALF = df_scenarios$PHALF,
  RELHR = df_scenarios$RELHR,
  LOWP = df_scenarios$LOWP,
  DCREL = df_scenarios$DCREL,
  MoreArgs = list(param = param)
)

params_dt <- data.table::rbindlist(params_lst)
data.table::fwrite(params_dt, "out/params_scenarios.csv")

### Tests ----------------------------------------------------------------------
## control$nsims <- 1
## control$ncores <- 1
## control$verbose <- TRUE

## test_num <- 10
## SIMNO <- df_scenarios$SIMNO[test_num]
## PSP <- df_scenarios$PSP[test_num]
## PPI <- df_scenarios$PPI[test_num]
## PICPT <- df_scenarios$PICPT[test_num]
## PHALF <- df_scenarios$PHALF[test_num]
## RELHR <- df_scenarios$RELHR[test_num]
## LOWP <- df_scenarios$LOWP[test_num]
## DCREL <- df_scenarios$DCREL[test_num]
## repl_num <- repl_nums[test_num]
## n_steps <- 52

## ## allr::r(slurm_scenario, list(
##   orig, param, init, control,
##   scenarios_content[[1]], scenarios_names[[1]], 1, 2 * 52)
## )

## callr::r(slurm_scenario, list(
##   orig, param, init, control,
##   scenarios_content[[1]], scenarios_names[[1]], 2, 2 * 52)
## )

## callr::r(slurm_scenario, list(
##   orig, param, init, control,
##   scenarios_content[[2]], scenarios_names[[2]], 1, 2 * 52)
## )

## callr::r(slurm_scenario, list(
##   orig, param, init, control,
##   scenarios_content[[2]], scenarios_names[[2]], 2, 2 * 52)
## )

## callr::r(slurm_scenario_combine, list("slurm_wf/out"))

## dt <- readRDS("slurm_wf/out/scenarios_out.rds")
## dt <- dt[names(param$epi_funs)]
## dt
