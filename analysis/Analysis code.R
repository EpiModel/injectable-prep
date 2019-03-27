rm(list = ls())
library("EpiModelHIV")
library("EpiModelHPC")

library("dplyr")

library("ggplot2")
library("viridis")
library("gridExtra")

source("analysis/fx2.R")

### TABLE 1

# Base scenario

load("data/sim.n2000.rda")
sim.base <- sim
epi_stats(sim.base, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Counterfactual scenarios

# P(PrEP | Indication) = 10.4%
  # P(LAI | PrEP) = 25%
  load("data/sim.n2004.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 50%
  load("data/sim.n2008.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 75%
  load("data/sim.n2012.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 100%
  load("data/sim.n2016.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(PrEP | Indication) = 20%
  # P(LAI | PrEP) = 0%
  load("data/sim.n2001.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 25%
  load("data/sim.n2005.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 50%
  load("data/sim.n2009.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 75%
  load("data/sim.n2013.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 100%
  load("data/sim.n2017.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(PrEP | Indication) = 40%
  # P(LAI | PrEP) = 0%
  load("data/sim.n2002.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 25%
  load("data/sim.n2006.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 50%
  load("data/sim.n2010.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 75%
  load("data/sim.n2014.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 100%
  load("data/sim.n2018.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(PrEP | Indication) = 50%
  # P(LAI | PrEP) = 0%
  load("data/sim.n2003.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 25%
  load("data/sim.n2007.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 50%
  load("data/sim.n2011.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 75%
  load("data/sim.n2015.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 100%
  load("data/sim.n2019.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

### TABLE 2

  # Base scenario

  load("data/sim.n2008.rda")
  sim.base <- sim
  epi_stats(sim.base, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Counterfactual scenarios

  # 50% Decrease
  load("data/sim.n5000.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # 25% Decrease
  load("data/sim.n5001.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # 10% Decrease
  load("data/sim.n5002.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # 5% Decrease
  load("data/sim.n5003.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # 5% Increase
  load("data/sim.n5004.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # 10% Increase
  load("data/sim.n5005.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # 25% Increase
  load("data/sim.n5006.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # 50% Increase
  load("data/sim.n5007.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

### TABLE 3

  # Base scenario

  load("data/sim.n2008.rda")
  sim.base <- sim
  epi_stats(sim.base, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Counterfactual scenarios

# DC Rate = 150%
  # Fraction Low Persistent (LP) = 0%
  load("data/sim.n6000.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 25%
  load("data/sim.n6001.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 50%
  load("data/sim.n6002.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 75%
  load("data/sim.n6003.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 100%
  load("data/sim.n6004.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# DC Rate = 200%
  # Fraction Low Persistent (LP) = 0%
  load("data/sim.n6005.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 25%
  load("data/sim.n6006.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 50%
  load("data/sim.n6007.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 75%
  load("data/sim.n6008.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 100%
  load("data/sim.n6009.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# DC Rate = 250%
  # Fraction Low Persistent (LP) = 0%
  load("data/sim.n6010.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 25%
  load("data/sim.n6011.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 50%
  load("data/sim.n6012.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 75%
  load("data/sim.n6013.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 100%
  load("data/sim.n6014.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# DC Rate = 300%
  # Fraction Low Persistent (LP) = 0%
  load("data/sim.n6015.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 25%
  load("data/sim.n6016.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 50%
  load("data/sim.n6017.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 75%
  load("data/sim.n6018.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 100%
  load("data/sim.n6019.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

### FIGURE 1

  # Process Data --------------------------------------------------------

  load("data/sim.n2000.rda")
  sim.base <- sim
  incid.base <- unname(colSums(sim.base$epi$incid))

  sims <- 3000:3120

  for (i in seq_along(sims)) {
    fn <- list.files("data/", pattern = as.character(sims[i]), full.names = TRUE)
    load(fn)

    prev <- as.numeric(tail(sim$epi$i.prev, 1))
    ir <- as.numeric(colMeans(tail(sim$epi$ir100), 52))

    incid.comp <- unname(colSums(sim$epi$incid))

    nia <- incid.base - incid.comp
    pia <- nia/incid.base

    new.df <- data.frame(scen = sims[i],
                         psp = sim$param$prep.start.prob,
                         ppi = 1 - sim$param$prep.prob.oral,
                         prev = prev,
                         ir = ir,
                         pia = pia)

    if (i == 1) {
      df <- new.df
    } else {
      df <- rbind(df, new.df)
    }

    cat("*")
  }

  nrow(df)

  table(df$psp)
  table(df$ppi)
  table(df$psp, df$ppi)

  ## PIA
  fit.loess <- loess(pia ~ psp * ppi, data = df)
  preds.loess <- expand.grid(list(psp = seq(0, 1, 0.01),
                                  ppi = seq(0, 1, 0.01)))
  preds.loess$z <- as.numeric(predict(fit.loess, newdata = preds.loess))

  ggplot(preds.loess, aes(psp, ppi)) +
    geom_raster(aes(fill = z), interpolate = TRUE) +
    geom_contour(aes(z = z), col = "white", alpha = 0.5, lwd = 0.5) +
    theme_classic() +
    scale_y_continuous(expand = c(0, 0)) +
    scale_x_continuous(expand = c(0, 0)) +
    labs(y = "Injectable PrEP", x = "PrEP Uptake", fill = "PIA") +
  # ggtitle("Percent of Infections Averted (PIA) at varying levels of \nPrEP uptake and proportion choosing \nInjectable PrEP vs. Daily Oral PrEP") +
    ggtitle("Figure 1") +
    scale_fill_viridis(discrete = FALSE, alpha = 1, option = "D", direction = 1)


  par(mar = c(3,3,2,1), mgp = c(2,1,0))
  boxplot(pia ~ psp, data = df, outline = FALSE, col = "orange", medlwd = 1.5)
  boxplot(pia ~ ppi, data = df, outline = FALSE, col = "orange", medlwd = 1.5)

  df2 <- filter(df, psp == 0.3)
  head(df2)

  boxplot(pia ~ ppi, data = df2, outline = FALSE, col = "orange", medlwd = 1.5)

  library("plotly")
  psp <- unique(preds.loess$psp)
  ppi <- unique(preds.loess$ppi)
  zmat <- matrix(preds.loess$z, nrow = 101, ncol = 101, byrow = TRUE)
  p <- plot_ly(x = psp, y = ppi, z = zmat) %>% add_surface()
  p

  kd <- with(MASS::geyser, MASS::kde2d(duration, waiting, n = 50))

### Figure 2

  load("data/sim.n2008.rda")
  sim.base <- sim
  incid.base <- unname(colSums(sim.base$epi$incid))

  sims2 <- 4000:4109

  for (i in seq_along(sims2)) {
    fn2 <- list.files("data/", pattern = as.character(sims2[i]), full.names = TRUE)
    load(fn2)

    prev <- as.numeric(tail(sim$epi$i.prev, 1))
    ir <- as.numeric(colMeans(tail(sim$epi$ir100), 52))

    incid.comp <- unname(colSums(sim$epi$incid))

    nia <- incid.base - incid.comp
    pia <- nia/incid.base

    new.df2 <- data.frame(scen = sims2[i],
                         picpt = sim$param$prepla.dlevel.icpt,
                         phalf = sim$param$prepla.dlevel.halflife.int,
                         prev = prev,
                         ir = ir,
                         pia = pia)

    if (i == 1) {
      df2 <- new.df2
    } else {
      df2 <- rbind(df2, new.df2)
    }

    cat("*")
  }

  nrow(df2)

  table(df2$picpt)
  table(df2$phalf)
  table(df2$picpt, df2$phalf)

  ## PIA
  fit.loess2 <- loess(pia ~ picpt * phalf, data = df2)
  preds.loess2 <- expand.grid(list(picpt = seq(1.5, 6.5, 0.01),
                                  phalf = seq(2, 9, 0.01)))
  preds.loess2$z <- as.numeric(predict(fit.loess2, newdata = preds.loess2))

  ggplot(preds.loess2, aes(picpt, phalf)) +
    geom_raster(aes(fill = z), interpolate = TRUE) +
    geom_contour(aes(z = z), col = "white", alpha = 0.5, lwd = 0.5) +
    theme_classic() +
    scale_y_continuous(expand = c(0, 0)) +
    scale_x_continuous(expand = c(0, 0)) +
    labs(y = "Half-life (Weeks)", x = "Peak Plasma Concentration (", fill = "PIA") +
    ggtitle("Figure 2") +
    scale_fill_viridis(discrete = FALSE, alpha = 1, option = "D", direction = 1)


  par(mar = c(3,3,2,1), mgp = c(2,1,0))
  boxplot(pia ~ picpt, data = df2, outline = FALSE, col = "orange", medlwd = 1.5)
  boxplot(pia ~ phalf, data = df2, outline = FALSE, col = "orange", medlwd = 1.5)

  df2 <- filter(df2, psp == 0.3)
  head(df2)

  boxplot(picpt ~ phalf, data = df2, outline = FALSE, col = "orange", medlwd = 1.5)

  library("plotly")
  picpt <- unique(preds.loess$picpt)
  phalf <- unique(preds.loess$phalf)
  zmat <- matrix(preds.loess$z, nrow = 101, ncol = 101, byrow = TRUE)
  p <- plot_ly(x = picpt, y = phalf, z = zmat) %>% add_surface()
  p

  kd <- with(MASS::geyser, MASS::kde2d(duration, waiting, n = 50))
