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
  # google sheet: https://docs.google.com/spreadsheets/d/1GWFrDqvTpdK24f6Lzqg3xdzCobbvOXj7Bpalq7xLUX4/edit?ts=5defba8b#gid=0
  cc.dx.B = 0.804,
  cc.dx.H = 0.799,
  cc.dx.W = 0.88,
  cc.linked1m.B = 0.62,
  cc.linked1m.H = 0.65,
  cc.linked1m.W = 0.76,
  cc.vsupp.B = 0.55,
  cc.vsupp.H = 0.60,
  cc.vsupp.W = 0.72,
  prep_prop = 0.15
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

## Calculate prop_prop (by reference so no assignement)
dt[, prep_prop := prepCurr / prepElig]

# Target plot 2013
sim_plot_targets(dt, targets, 52 * 60)

sim_plot_targets(dt, targets, 52 * 65)

ggsave("out/plot/calib1.png", width = 16, height = 9)

sim_plot_targets(dt[param_grp == 6], targets, 52 * 65)

sums <- target_sum(
  dt,
  names(targets), funs, targets,
  nsteps = 1, grp ="param_grp"
)

sums <- target_sum(
  ## dt[time < 52 * 80 + 52 * 5],
  dt[time < 52 * 60 + 5],
  names(targets), funs, targets,
  nsteps = 1, grp ="param_grp"
)

sums <- target_sum(
  ## dt[time < 52 * 80 + 52 * 4.5 & param_grp == 5],
  dt[time < 52 * 60 + 52 * 4.5 & param_grp == 5],
  names(targets),
  funs, targets, nsteps = 26
)

print(sums[order(param_grp, as.character(variable))], nrows = 200)
print(sums[grep("^dx.W", variable)])
print(sums[grep("prep", variable)])
print(sums[grep("prev", variable)])

print(sums[grep("linked", variable)])
print(sums[grep("sup", variable)])

print(sums, nrows = 200)

p <- ggplot(dt, aes(x = time, col = param_grp)) +
  geom_vline(xintercept = 52*65) +
  geom_vline(xintercept = 52 * 69)

p1 <- p + geom_smooth(aes(y = dx_prep))
p2 <- p + geom_smooth(aes(y = incid_prep))
p3 <- p + geom_smooth(aes(y = dx))
p4 <- p + geom_smooth(aes(y = inftime_prep))

(p3 / p1) |  (p4 / p2)
ggsave("out/plots/prep_eval.png")

p + geom_smooth(aes(y = incid))

p + geom_smooth(aes(y = dx))
p + geom_smooth(aes(y = prep))
p + geom_smooth(aes(y = prep_any12m))
p + geom_smooth(aes(y = linked1m_new), se = F)
p + geom_smooth(aes(y = linked3m))
p + geom_smooth(aes(y = tx))
p + geom_smooth(aes(y = sup_dx))
p + geom_smooth(aes(y = sup_dx.B))
p + geom_smooth(aes(y = sup_dx.H))
p + geom_smooth(aes(y = sup_dx.W))
p + geom_smooth(aes(y = sup_tx))
p + geom_smooth(aes(y = sup_tx.W))

p <- ggplot(dt[time < 5408], aes(x = time, col = param_grp)) +
  geom_vline(xintercept = 4160) +
  geom_vline(xintercept = 4888) +
  geom_vline(xintercept = 4368)


int_cols <- c("prev", "tx.W", "dx", "prep", "linked1m_new",
              "sup_tx.W", "sup_dx.W")
dt_plots <- dt[, lapply(.SD, median), by = c("time", "param_grp"),
               .SDcols = int_cols]

p <- ggplot(dt_plots, aes(x = time, col = param_grp)) +
  geom_vline(xintercept = 4160) +
  geom_vline(xintercept = 4888) +
  geom_vline(xintercept = 4368)


for(n in syms(int_cols)) {
  pl <- p + geom_line(aes(y = !!n)) # + geom_smooth(aes(y = !!n), se = F) + geom_line(aes(y = !!n), alpha = 0.5)
  ggsave(paste0("out/plots/", n, ".png"), plot = pl, width = 16, height = 9)
}

p + geom_smooth(aes_string(y = "tx.W"), se = F) + geom_line(aes(y = tx.W))
p + geom_smooth(aes(y = dx.W), se = F)
p + geom_smooth(aes(y = prep))
p + geom_line(aes(y = prep_any12m))
p + geom_smooth(aes(y = linked1m_new), se = F)
p + geom_smooth(aes(y = linked3m.W), se = F)
p + geom_line(aes(y = tx.W))
p + geom_smooth(aes(y = sup_dx.W))
p + geom_line(aes(y = sup_tx.W))

dt[time == 4161, lapply(.SD, median),
   by = "param_grp", .SDcols = c("tx.W", "tx.B", "tx.H")]

dt[time == 4368, lapply(.SD, median),
   by = "param_grp", .SDcols = c("tx.W", "tx.B", "tx.H")]

dt[time == 4472, lapply(.SD, median),
   by = "param_grp", .SDcols = c("tx.W", "tx.B", "tx.H")]

## Choice
source("R/utils-sim_choice.R")
target_names <- c("prev.B", "tx.B", "prev.H", "tx.H", "prev.W", "tx.W", "prep",
                  "dx", "sup_dx.B", "sup_dx.H", "sup_dx.W")

targets <- dt[time == max(time), lapply(.SD, median, na.rm = TRUE),
              .SDcols = target_names]

dt_choice <- dt[time == max(time), c(c("sim_id", ..target_names))
                  ][, Map(`-`, .SD, targets), by = "sim_id"]

best_sim <- dt_choice[, .(score = dist_squ(as.numeric(.SD), 0)), by = "sim_id"
                      ][which.min(score), sim_id]

as.list(dt_choice[sim_id == best_sim])

best_sim # "1/sim333.rds--17"
sim <- readRDS("out/sim333.rds")
orig <- EpiModel::get_sims(sim, 17)
saveRDS(orig, "out/est/restart.rds")
