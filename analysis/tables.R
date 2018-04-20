
## STI PrEP Tables 1 and 2

rm(list = ls())
library("EpiModelHIV")
library("EpiModelHPC")
library("dplyr")
source("analysis/fx.R")

# Base scenario
load("data/t1/sim.n2000.rda")
sim.base <- sim
epi_stats(sim.base, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Table 1

# Obs B Scenario
load("data/t1/sim.n2001.rda")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Awareness: 2002, 3, 4
load("data/t1/sim.n2004.rda")
sim$param$prep.aware.B
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Access: 2005, 6, 7
load("data/t1/sim.n2007.rda")
sim$param$prep.access.B
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Rx: 2008, 9, 10
load("data/t1/sim.n2010.rda")
sim$param$prep.rx.B
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Adh: 2011, 12, 13
load("data/t1/sim.n2013.rda")
sim$param$prep.adhr.dist.B
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Discont: 2014, 15, 16
load("data/t1/sim.n2016.rda")
sim$param$prep.discont.rate.B
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)


# Table 2

# Joint: 2017-21
load("data/t1/sim.n2131.rda")
sim$param$prep.aware.B
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Joint: Obs B x 150%
load("data/f1/sim.n2152.rda")
sim$param$prep.aware.B
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Joint: Obs B x 200%
load("data/f1/sim.n2162.rda")
sim$param$prep.aware.B
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)
