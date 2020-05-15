rm(list = ls())
library("EpiModelHIV")
library("EpiModelHPC")

library("dplyr")

library("ggplot2")
library("viridis")
library("gridExtra")

source("analysis/fx.R")

### TABLE 2  --------------------------------------------------------
# Varying Rate of PrEP Initiation & P(LAI vs Oral)

# Base scenario -- No LAI PrEP

sim.base <- readRDS("data/sim_2001.rds")
epi_stats(sim.base, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Counterfactual scenarios

### Initiation Rate = 0.5x
# P(LAI | PrEP) = 0%
sim <- readRDS("data/sim_2000.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(LAI | PrEP) = 25%
sim <- readRDS("data/sim_2006.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(LAI | PrEP) = 50%
sim <- readRDS("data/sim_2012.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(LAI | PrEP) = 75%
sim <- readRDS("data/sim_2018.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(LAI | PrEP) = 100%
sim <- readRDS("data/sim_2024.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)


### Initiation Rate = 1x
# P(LAI | PrEP) = 25%
sim <- readRDS("data/sim_2007.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(LAI | PrEP) = 50%
sim <- readRDS("data/sim_2013.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(LAI | PrEP) = 75%
sim <- readRDS("data/sim_2019.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(LAI | PrEP) = 100%
sim <- readRDS("data/sim_2025.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)


### Initiation Rate = 1.5x
# P(LAI | PrEP) = 0%
sim <- readRDS("data/sim_2002.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(LAI | PrEP) = 25%
sim <- readRDS("data/sim_2008.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(LAI | PrEP) = 50%
sim <- readRDS("data/sim_2014.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(LAI | PrEP) = 75%
sim <- readRDS("data/sim_2020.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(LAI | PrEP) = 100%
sim <- readRDS("data/sim_2026.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)


### Initiation Rate = 2x
# P(LAI | PrEP) = 0%
sim <- readRDS("data/sim_2003.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(LAI | PrEP) = 25%
sim <- readRDS("data/sim_2009.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(LAI | PrEP) = 50%
sim <- readRDS("data/sim_2015.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(LAI | PrEP) = 75%
sim <- readRDS("data/sim_2021.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(LAI | PrEP) = 100%
sim <- readRDS("data/sim_2027.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)


### Initiation Rate = 3x
# P(LAI | PrEP) = 0%
sim <- readRDS("data/sim_2004.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(LAI | PrEP) = 25%
sim <- readRDS("data/sim_2010.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(LAI | PrEP) = 50%
sim <- readRDS("data/sim_2016.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(LAI | PrEP) = 75%
sim <- readRDS("data/sim_2022.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(LAI | PrEP) = 100%
sim <- readRDS("data/sim_2028.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)


### Initiation Rate = 4x
# P(LAI | PrEP) = 0%
sim <- readRDS("data/sim_2005.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(LAI | PrEP) = 25%
sim <- readRDS("data/sim_2011.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(LAI | PrEP) = 50%
sim <- readRDS("data/sim_2017.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(LAI | PrEP) = 75%
sim <- readRDS("data/sim_2023.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(LAI | PrEP) = 100%
sim <- readRDS("data/sim_2029.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

### TABLE 3  --------------------------------------------------------
# Varying Median Time on LAI-PrEP for Spontaneous Discontinuation

## Base scenario

sim.base <- readRDS("data/sim_2001.rds")
epi_stats(sim.base, at = 520, qnt.low = 0.025, qnt.high = 0.975)

## Counterfactual scenarios

# Median Time / 3

sim <- readRDS("data/sim_6000.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Median Time / 2.5

sim <- readRDS("data/sim_6001.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Median Time / 2

sim <- readRDS("data/sim_6002.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Median Time / 1.5

sim <- readRDS("data/sim_6003.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Median Time / 1

sim <- readRDS("data/sim_6004.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Median Time * 1.5

sim <- readRDS("data/sim_6005.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Median Time * 2

sim <- readRDS("data/sim_6006.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Median Time * 2.5

sim <- readRDS("data/sim_6007.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Median Time * 3

sim <- readRDS("data/sim_6008.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

### TABLE S1  --------------------------------------------------------
# Varying Efficacy of LAI PrEP

# Base scenario

sim.base <- readRDS("data/sim_2001.rds")
epi_stats(sim.base, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Counterfactual scenarios

# 1/1.5x
sim <- readRDS("data/sim_5000.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# 1/1.25x
sim <- readRDS("data/sim_5001.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# 1/1.1x
sim <- readRDS("data/sim_5002.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# 1/1.05x
sim <- readRDS("data/sim_5003.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# 1x
sim <- readRDS("data/sim_2013.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# 1.05x
sim <- readRDS("data/sim_5004.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# 1.1x
sim <- readRDS("data/sim_5005.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# 1.25x
sim <- readRDS("data/sim_5006.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# 1.5x
sim <- readRDS("data/sim_5007.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)
