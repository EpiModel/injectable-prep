library(data.table)
library(ggplot2)
library(patchwork)
theme_set(theme_light())
source("R/utils-simeval.R")

targets <- c(
  # CombPrev appendix 8.2.2
  i.prev.dx.B = 0.33,
  i.prev.dx.H = 0.127,
  i.prev.dx.W = 0.084,
  #prep_prop = 0.15,
  # google sheet: https://docs.google.com/spreadsheets/d/1GWFrDqvTpdK24f6Lzqg3xdzCobbvOXj7Bpalq7xLUX4/edit?ts=5defba8b#gid=0
  cc.dx.B = 0.804,
  cc.dx.H = 0.799,
  cc.dx.W = 0.88,
  cc.linked1m.B = 0.62,
  cc.linked1m.H = 0.65,
  cc.linked1m.W = 0.76,
  cc.vsupp.B = 0.55,
  cc.vsupp.H = 0.60,
  cc.vsupp.W = 0.72
)


funs <- list(
  mean    =  function(x) round(mean(x, na.rm = T), 3),
  median  =  function(x) simple_quantile(x, 0.5),
  minimum =  function(x) simple_quantile(x, 0),
  first_q =  function(x) simple_quantile(x, 0.25),
  third_q =  function(x) simple_quantile(x, 0.75),
  maximum =  function(x) simple_quantile(x, 1)
)

sim_plot_targets <- function(dt, targets, at) {
  dt <- copy(dt[time == at])

  for (col in names(targets))
    set(dt, j = col, value = dt[[col]] - targets[[col]])

  dt_l <- melt(dt, id.vars = "sim_id", measure.vars = names(targets))

  ggplot(dt_l, aes(y = value, x = variable)) +
    geom_boxplot() +
    geom_hline(yintercept = 0, col = "firebrick") +
    geom_hline(yintercept = c(0.01, -0.01), linetype = "dotted") +
    geom_hline(yintercept = c(0.02, -0.02), linetype = "dashed")
}

# Read the data.table from the .rds if it exists then write it as an
# uncompressed csv (can be several GB) and delete .rds. Otherwise fread .csv
if (file.exists("out/calib/big_sim.rds")) {
  dt <- readRDS("out/calib/big_sim.rds")
  gc() # if dt is big this forces R to releases memory
  saveRDS(dt, "out/calib/uncompressed_sims.rds", compress = FALSE)
  file.remove("out/calib/big_sim.rds")
  gc() # if dt is big this forces R to releases memory
} else {
  dt <- readRDS("out/calib/uncompressed_sims.rds")
}

## # Choose among downloaed sims
## sims <- lapply(c("out/calib/sim42.rds",
##                  "out/calib/sim148.rds",
##                  "out/calib/sim48.rds"), function(x) {
##   sim <- readRDS(x)
##   dt <- as.data.table(sim)
##   dt[, sim_id := paste0(..x, sim)]
## })

## dt <- rbindlist(sims)

## Calculate prop_prop (by reference so no assignement)
dt[, prep_prop := prepCurr / prepElig]

# Target plot 2013
sim_plot_targets(dt, targets, 52 * 60)


## Choice 2013
cols <- c("sim_id", names(targets))

dt_choice <- dt[time == 52 * 60
   ][, `:=`(
    ok = all(abs(.SD - targets) < 0.02),
    score = sum((.SD - targets)^2)),
     .SDcols = names(targets), by = "sim_id"
     ][(ok)][order(score)]

dt_choice[1:10, c(..cols, "ok", "score")][order(score)]

sim <- readRDS("out/calib/sim148.rds")
sim <- EpiModel::get_sims(sim, 23)

saveRDS(sim, "out/est/restart_base.rds")


