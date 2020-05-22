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

### Pharmacokinetics  --------------------------------------------------------
# Varying Peak Plasma Concentration & Half-life

# Base scenario

sim.base <- readRDS("data/sim_2001.rds")
epi_stats(sim.base, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Counterfactual scenarios

## Peak plasma concentration = 2
# Half life = 15 weeks
sim <- readRDS("data/sim_4001.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Half life = 25 weeks
sim <- readRDS("data/sim_4023.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Half life = 35 weeks
sim <- readRDS("data/sim_4045.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Half life = 45 weeks
sim <- readRDS("data/sim_4067.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Half life = 55 weeks
sim <- readRDS("data/sim_4089.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)


## Peak plasma concentration = 3
# Half life = 15 weeks
sim <- readRDS("data/sim_4003.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Half life = 25 weeks
sim <- readRDS("data/sim_4025.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Half life = 35 weeks
sim <- readRDS("data/sim_4047.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Half life = 45 weeks
sim <- readRDS("data/sim_4069.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Half life = 55 weeks
sim <- readRDS("data/sim_4091.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)


## Peak plasma concentration = 3.59
# Half life = 15 weeks
sim <- readRDS("data/sim_7000.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Half life = 25 weeks
sim <- readRDS("data/sim_7022.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Half life = 35 weeks -- using 2013 as this is base case in other analyses
sim <- readRDS("data/sim_2013.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Half life = 45 weeks
sim <- readRDS("data/sim_7066.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Half life = 55 weeks
sim <- readRDS("data/sim_7088.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)


## Peak plasma concentration = 4
# Half life = 15 weeks
sim <- readRDS("data/sim_4005.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Half life = 25 weeks
sim <- readRDS("data/sim_4027.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Half life = 35 weeks
sim <- readRDS("data/sim_4049.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Half life = 45 weeks
sim <- readRDS("data/sim_4071.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Half life = 55 weeks
sim <- readRDS("data/sim_4093.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)


## Peak plasma concentration = 5
# Half life = 15 weeks
sim <- readRDS("data/sim_4007.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Half life = 25 weeks
sim <- readRDS("data/sim_4029.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Half life = 35 weeks
sim <- readRDS("data/sim_4051.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Half life = 45 weeks
sim <- readRDS("data/sim_4073.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Half life = 55 weeks
sim <- readRDS("data/sim_4095.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

### Discontinuation  --------------------------------------------------------
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

# Median Time * 1

sim <- readRDS("data/sim_2013.rds")
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

### Efficacy  --------------------------------------------------------

# Base scenario

sim.base <- readRDS("data/sim_2001.rds")
epi_stats(sim.base, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Counterfactual scenarios

# 50% increase
sim <- readRDS("data/sim_5000.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# 25% increase
sim <- readRDS("data/sim_5001.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# 10% increase
sim <- readRDS("data/sim_5002.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# 5% increase
sim <- readRDS("data/sim_5003.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Base model
sim <- readRDS("data/sim_2013.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# 5% decrease
sim <- readRDS("data/sim_5004.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# 10% decrease
sim <- readRDS("data/sim_5005.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# 25% decrease
sim <- readRDS("data/sim_5006.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# 50% decrease
sim <- readRDS("data/sim_5007.rds")
epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)
