library(EpiModelHIV)
library(data.table)

sim <- readRDS("out/scenarios/sim_2006.rds")
dt <- as.data.table(sim)


dt[time == max(time), lapply(.SD, mean),
   .SDcols = c("prepCurr", "prep.laCurr", "prepElig", "prepCurr.8w.la")
   ][, .(do = prepCurr / prepElig,
         la = prep.laCurr / prepElig,
         w8 = prepCurr.8w.la / prepElig)]

