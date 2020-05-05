library(EpiModelHIV)
library(data.table)

sim <- readRDS("out/scenarios/out_comb/sim_2015.rds")

dt <- as.data.table(sim)

names(dt)

dt[time == max(time), lapply(.SD, mean), .SDcols = c("prepCurr", "prep.laCurr", "prepElig")
   ][, .(do = prepCurr / prepElig, la = prep.laCurr / prepElig)]


library(tidyverse)

sim.base <- mutate_epi(sim.base, percPrEP.i = prepCurr.8w.la / num)

  percP.i <- as.numeric(colMeans(tail(sim.base$epi$percPrEP.i, 52)))

  percP.base.i <- round(data.frame(median = median(percP.i),
                                   ql = quantile(percP.i, qnt.low, names = FALSE),
                                   qu = quantile(percP.i, qnt.high, names = FALSE)), 3)
