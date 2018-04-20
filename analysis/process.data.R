
## Process LA PrEP data

rm(list = ls())
library("EpiModelHIV")

sim <- NULL

# Table 1 data

system("scp hyak:/suppscr/csde/sjenness/lap/data/sim.n2*.rda data/")

(fn <- list.files("data", pattern = "sim.n2010.*", full.names = TRUE))

# Truncate, reduce
for (i in fn) {
  load(i)
  sim <- truncate_sim(sim, at = 2600)
  vars.needed <- c("i.prev", "num", "s.num", "i.num", "incid", "ir100")
  sim$epi <- sim$epi[which(names(sim$epi) %in% vars.needed)]
  save(sim, file = i, compress = "xz")
  cat("\n", i)
}
