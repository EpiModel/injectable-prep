rm(list = ls())
library("EpiModelHIV")
library("EpiModelHPC")

library("dplyr")

library("ggplot2")
library("viridis")
library("gridExtra")

source("analysis/fx2.R")

### TABLE 1  --------------------------------------------------------
# Varying P(Initiate|Indication) & P(LAI vs Oral)

# Base scenario -- No LAI PrEP

load("data/sim.n2001.rda")
sim.base <- sim
epi_stats(sim.base, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Counterfactual scenarios

# P(PrEP | Indication) = 21%
  # P(LAI | PrEP) = 25%
  load("data/sim.n2006.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 50%
  load("data/sim.n2011.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 75%
  load("data/sim.n2016.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 100%
  load("data/sim.n2021.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(PrEP | Indication) = 10%
  # P(LAI | PrEP) = 0%
  load("data/sim.n2000.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 25%
  load("data/sim.n2005.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 50%
  load("data/sim.n2010.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 75%
  load("data/sim.n2015.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 100%
  load("data/sim.n2020.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(PrEP | Indication) = 30%
  # P(LAI | PrEP) = 0%
  load("data/sim.n2002.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 25%
  load("data/sim.n2007.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 50%
  load("data/sim.n2012.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 75%
  load("data/sim.n2017.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 100%
  load("data/sim.n2022.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(PrEP | Indication) = 40%
  # P(LAI | PrEP) = 0%
  load("data/sim.n2003.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 25%
  load("data/sim.n2008.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 50%
  load("data/sim.n2013.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 75%
  load("data/sim.n2018.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 100%
  load("data/sim.n2023.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# P(PrEP | Indication) = 50%
  # P(LAI | PrEP) = 0%
  load("data/sim.n2004.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 25%
  load("data/sim.n2009.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 50%
  load("data/sim.n2014.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 75%
  load("data/sim.n2019.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 100%
  load("data/sim.n2024.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)


# Base scenario -- No PrEP

  load("data/sim.n100.rda")
  sim.base <- sim
  epi_stats(sim.base, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Counterfactual scenarios

  # P(PrEP | Indication) = 21%
  # P(LAI | PrEP) = 0%
  load("data/sim.n2001.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(PrEP | Indication) = 21%
  # P(LAI | PrEP) = 25%
  load("data/sim.n2006.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 50%
  load("data/sim.n2011.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 75%
  load("data/sim.n2016.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 100%
  load("data/sim.n2021.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(PrEP | Indication) = 10%
  # P(LAI | PrEP) = 0%
  load("data/sim.n2000.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 25%
  load("data/sim.n2005.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 50%
  load("data/sim.n2010.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 75%
  load("data/sim.n2015.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 100%
  load("data/sim.n2020.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(PrEP | Indication) = 30%
  # P(LAI | PrEP) = 0%
  load("data/sim.n2002.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 25%
  load("data/sim.n2007.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 50%
  load("data/sim.n2012.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 75%
  load("data/sim.n2017.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 100%
  load("data/sim.n2022.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(PrEP | Indication) = 40%
  # P(LAI | PrEP) = 0%
  load("data/sim.n2003.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 25%
  load("data/sim.n2008.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 50%
  load("data/sim.n2013.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 75%
  load("data/sim.n2018.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 100%
  load("data/sim.n2023.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(PrEP | Indication) = 50%
  # P(LAI | PrEP) = 0%
  load("data/sim.n2004.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 25%
  load("data/sim.n2009.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 50%
  load("data/sim.n2014.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 75%
  load("data/sim.n2019.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # P(LAI | PrEP) = 100%
  load("data/sim.n2024.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)



### TABLE 2  --------------------------------------------------------
# Varying Persistence Fraction & Median Time on PrEP

# Base scenario

  load("data/sim.n2001.rda")
  sim.base <- sim
  epi_stats(sim.base, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Counterfactual scenarios

# Median Time x 50%
  # Fraction Low Persistent (LP) = 0%
  load("data/sim.n6000.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 21.5%
  load("data/sim.n6001.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 25%
  load("data/sim.n6002.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 50%
  load("data/sim.n6003.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 75%
  load("data/sim.n6004.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 100%
  load("data/sim.n6005.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Median Time x 100%
  # Fraction Low Persistent (LP) = 0%
  load("data/sim.n6006.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 21.5%
  load("data/sim.n2011.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 25%
  load("data/sim.n6008.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 50%
  load("data/sim.n6009.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 75%
  load("data/sim.n6010.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 100%
  load("data/sim.n6011.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Median Time x 150%
  # Fraction Low Persistent (LP) = 0%
  load("data/sim.n6012.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 21.5%
  load("data/sim.n6013.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 25%
  load("data/sim.n6014.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 50%
  load("data/sim.n6015.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 75%
  load("data/sim.n6016.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 100%
  load("data/sim.n6017.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Median Time x 200%
  # Fraction Low Persistent (LP) = 0%
  load("data/sim.n6018.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 21.5%
  load("data/sim.n6019.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 25%
  load("data/sim.n6020.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 50%
  load("data/sim.n6021.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 75%
  load("data/sim.n6022.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 100%
  load("data/sim.n6023.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Median Time x 250%
  # Fraction Low Persistent (LP) = 0%
  load("data/sim.n6024.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 21.5%
  load("data/sim.n6025.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 25%
  load("data/sim.n6026.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 50%
  load("data/sim.n6027.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 75%
  load("data/sim.n6028.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 100%
  load("data/sim.n6029.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

# Median Time x 300%
  # Fraction Low Persistent (LP) = 0%
  load("data/sim.n6030.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 21.5%
  load("data/sim.n6031.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 25%
  load("data/sim.n6032.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 50%
  load("data/sim.n6033.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 75%
  load("data/sim.n6034.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 100%
  load("data/sim.n6035.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)


### TABLE 3  --------------------------------------------------------
# Varying Efficacy of LAI PrEP

  # Base scenario

  load("data/sim.n2001.rda")
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


### FIGURE 1  --------------------------------------------------------
# Varying P(Initiate|Indication) & P(LAI vs Oral)

  # Process Data
  load("data/sim.n2001.rda")
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
    labs(y = "Probability of choosing LAI-PrEP", x = "Probability of Initiating PrEP", fill = "PIA") +
    scale_fill_viridis(discrete = FALSE, alpha = 1, option = "D", direction = -1,
                       breaks = c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5),
                       labels = c("0%","10%","20%","30%","40%","50%")) +
    theme(legend.position = "right",
          axis.text = element_text(size = 9, colour = "black"),
          axis.title = element_text(size = 11),
          legend.text = element_text(size = 9),
          legend.title = element_text(size = 10),
          axis.ticks.length = unit(0.25, "cm"),
          axis.ticks = element_line(color = "black"))


  par(mar = c(3,3,2,1), mgp = c(2,1,0))
  boxplot(pia ~ psp, data = df, outline = FALSE, col = "orange", medlwd = 1.5, xlab = "Probability of Initiating PrEP", ylab = "PIA")
  boxplot(pia ~ ppi, data = df, outline = FALSE, col = "orange", medlwd = 1.5, xlab = "Proportion LAI-PrEP", ylab = "PIA")

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

### FIGURE 2 --------------------------------------------------------

  load("data/sim.n2001.rda")
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
    geom_hline(yintercept= 5, linetype="dashed") +
    geom_vline(xintercept = 3.59, linetype="dashed") +
    theme_classic() +
    scale_y_continuous(expand = c(0, 0)) +
    scale_x_continuous(expand = c(0, 0)) +
    labs(y = "Half-life (Weeks)", x = "Peak Plasma Concentration (ug/ml)", fill = "PIA") +
    scale_fill_viridis(discrete = FALSE, alpha = 1, option = "D", direction = -1,
                       breaks = c(0.10, 0.12, 0.14, 0.16),
                       labels = c("10%","12%","14%","16%")) +
    theme(legend.position = "right",
          axis.text = element_text(size = 9, colour = "black"),
          axis.title = element_text(size = 11),
          legend.text = element_text(size = 9),
          legend.title = element_text(size = 10),
          axis.ticks.length = unit(0.25, "cm"),
          axis.ticks = element_line(color = "black"))

  par(mar = c(3,3,2,1), mgp = c(2,1,0))
  boxplot(pia ~ picpt, data = df2, outline = FALSE, col = "orange", medlwd = 1.5, xlab = "Intercept", ylab = "PIA")
  boxplot(pia ~ phalf, data = df2, outline = FALSE, col = "orange", medlwd = 1.5, xlab = "Half-life", ylab = "PIA")

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

  ### FIGURE 3 --------------------------------------------------------

  # Process Data

  load("data/sim.n2001.rda")
  sim.base <- sim
  incid.base <- unname(colSums(sim.base$epi$incid))

  sims3 <- 6500:6751

  for (i in seq_along(sims3)) {
    fn3 <- list.files("data/", pattern = as.character(sims3[i]), full.names = TRUE)
    load(fn3)

    prev <- as.numeric(tail(sim$epi$i.prev, 1))
    ir <- as.numeric(colMeans(tail(sim$epi$ir100), 52))

    incid.comp <- unname(colSums(sim$epi$incid))

    nia <- incid.base - incid.comp
    pia <- nia/incid.base

    new.df3 <- data.frame(scen = sims3[i],
                         lowp = sim$param$prep.adhr.dist.la,
                         dcrel = ((1 - (2^(-1/224.4237)))*7)/sim$param$prepla.discont.rate,
                         prev = prev,
                         ir = ir,
                         pia = pia)

    if (i == 1) {
      df3 <- new.df3
    } else {
      df3 <- rbind(df3, new.df3)
    }

    cat("*")
  }

  nrow(df3)

  table(df3$lowp)
  table(df3$dcrel)
  table(df3$lowp, df3$dcrel)

  ## PIA
  fit.loess3 <- loess(pia ~ lowp * dcrel, data = df3)
  preds.loess3 <- expand.grid(list(lowp = seq(0, 1, 0.01),
                                  dcrel = seq(0.25, 3, 0.01)))
  preds.loess3$z <- as.numeric(predict(fit.loess3, newdata = preds.loess3))

  ggplot(preds.loess3, aes(lowp, dcrel)) +
    geom_raster(aes(fill = z), interpolate = TRUE) +
    geom_contour(aes(z = z), col = "white", alpha = 0.5, lwd = 0.5) +
    theme_classic() +
    scale_y_continuous(expand = c(0, 0)) +
    scale_x_continuous(expand = c(0, 0)) +
    labs(y = "Relative Time on PrEP", x = "Proportion Low Persistent", fill = "PIA") +
   # scale_fill_viridis(discrete = FALSE, alpha = 1, option = "D", direction = 1)
   # scale_fill_distiller(type = "div", palette = "RdY1Gn", direction = 1,
  #                       breaks = c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5),
   #                      labels = c("0%","10%","20%","30%","40%","50%")) +
    theme(legend.position = "right",
          axis.text = element_text(size = 12, colour = "black"),
          axis.title = element_text(size = 12),
          legend.text = element_text(size = 12),
          legend.title = element_text(size = 12),
          axis.ticks.length = unit(0.25, "cm"),
          axis.ticks = element_line(color = "black"))

### ALTERNATIVE TABLE 2  --------------------------------------------------------
  # Varying Persistence Fraction & Median Time on PrEP

  # Base scenario

  load("data/sim.n2001.rda")
  sim.base <- sim
  epi_stats(sim.base, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Counterfactual scenarios

  # Median Time x 50%
  # Fraction Low Persistent (LP) = 0%
  load("data/sim.n6000.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 21.5%
  load("data/sim.n6001.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 25%
  load("data/sim.n6002.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 50%
  load("data/sim.n6003.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 75%
  load("data/sim.n6004.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 100%
  load("data/sim.n6005.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Median Time x 100%
  # Fraction Low Persistent (LP) = 0%
  load("data/sim.n6006.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 21.5%
  load("data/sim.n2011.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 25%
  load("data/sim.n6008.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 50%
  load("data/sim.n6009.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 75%
  load("data/sim.n6010.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 100%
  load("data/sim.n6011.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Median Time x 150%
  # Fraction Low Persistent (LP) = 0%
  load("data/sim.n6012.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 21.5%
  load("data/sim.n6013.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 25%
  load("data/sim.n6014.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 50%
  load("data/sim.n6015.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 75%
  load("data/sim.n6016.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 100%
  load("data/sim.n6017.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Median Time x 200%
  # Fraction Low Persistent (LP) = 0%
  load("data/sim.n6018.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 21.5%
  load("data/sim.n6019.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 25%
  load("data/sim.n6020.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 50%
  load("data/sim.n6021.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 75%
  load("data/sim.n6022.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 100%
  load("data/sim.n6023.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Median Time x 250%
  # Fraction Low Persistent (LP) = 0%
  load("data/sim.n6024.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 21.5%
  load("data/sim.n6025.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 25%
  load("data/sim.n6026.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 50%
  load("data/sim.n6027.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 75%
  load("data/sim.n6028.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 100%
  load("data/sim.n6029.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Median Time x 300%
  # Fraction Low Persistent (LP) = 0%
  load("data/sim.n6030.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 21.5%
  load("data/sim.n6031.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 25%
  load("data/sim.n6032.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 50%
  load("data/sim.n6033.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 75%
  load("data/sim.n6034.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

  # Fraction Low Persistent (LP) = 100%
  load("data/sim.n6035.rda")
  epi_stats(sim.base, sim, at = 520, qnt.low = 0.025, qnt.high = 0.975)

