
## Process LA PrEP data

rm(list = ls())
library("EpiModelHIV")

sim <- NULL

# Figure 1 data

(fn <- list.files("data/f1", full.names = TRUE))

# Truncate, reduce
for (i in fn) {
  load(i)
  vars.needed <- c("i.prev", "ir100", "incid")
  sim$epi <- sim$epi[which(names(sim$epi) %in% vars.needed)]
  save(sim, file = i, compress = "xz")
  cat("\n", i)
}
