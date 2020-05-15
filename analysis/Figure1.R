
# Process Data --------------------------------------------------------

sim.base <- readRDS("data/sim_2001.rds")
incid.base <- unname(colSums(sim.base$epi$incid))

sim.base <- mutate_epi(sim.base, percPrEP.ind.la = prepCurr.8w.la / (prepCurr + prepCurr.8w.la))
sim.base <- mutate_epi(sim.base, percPrEP.ind.t = (prepCurr + prepCurr.8w.la) / prepElig)

percP.ind.la <- as.numeric(colMeans(tail(sim.base$epi$percPrEP.ind.la, 52)))
percP.ind.base.la <- round(as.numeric(median(percP.ind.la)), 3)

percP.ind.t <- as.numeric(colMeans(tail(sim.base$epi$percPrEP.ind.t, 52)))
percP.ind.base.t <- round(as.numeric(median(percP.ind.t)), 3)

sims <- 3000:3120

for (i in seq_along(sims)) {
  fn <- list.files("data/", pattern = as.character(sims[i]), full.names = TRUE)
  sim <- readRDS(fn)

  sim <- mutate_epi(sim, percPrEP.ind.la = prepCurr.8w.la / (prepCurr + prepCurr.8w.la))
  sim <- mutate_epi(sim, percPrEP.ind.t = (prepCurr + prepCurr.8w.la) / prepElig)

  percP.ind.la <- as.numeric(colMeans(tail(sim$epi$percPrEP.ind.la, 52)))
  percP.ind.t <- as.numeric(colMeans(tail(sim$epi$percPrEP.ind.t, 52)))

  prev <- as.numeric(tail(sim$epi$i.prev, 1))
  ir <- as.numeric(colMeans(tail(sim$epi$ir100), 52))

  incid.comp <- unname(colSums(sim$epi$incid))

  nia <- incid.base - incid.comp
  pia <- nia/incid.base

  new.df <- data.frame(scen = sims[i],
                       percP.la = percP.ind.la,
                       percP.t = percP.ind.t,
                       prev = prev,
                       ir = ir,
                       pia = pia
                       )

  if (i == 1) {
    fig1.df <- new.df
  } else {
    fig1.df <- rbind(fig1.df, new.df)
  }

  cat("*")
}

fig1.df$percP.la[which(is.na(fig1.df$percP.la))] <- 0

## Creating a function for PIA according to % PrEP and % LAI-PrEP
fit.loess <- loess(pia ~ percP.t * percP.la, data = fig1.df)

# min(fig1.df$percP.la) # [1] 0
# max(fig1.df$percP.la) # [1] 1

# min(fig1.df$percP.t) # [1] 0
# max(fig1.df$percP.t) # [1] 0.6146004

preds.loess <- expand.grid(list(percP.la = seq(0, 1, 0.01),
                                percP.t  = seq(0, 0.6, 0.01)))
preds.loess$pia <- as.numeric(predict(fit.loess, newdata = preds.loess))

# Plot
ggplot(preds.loess, aes(percP.t, percP.la)) +
  geom_raster(aes(fill = pia), interpolate = TRUE) +
  geom_contour(aes(z = pia), col = "white", alpha = 0.5, lwd = 0.5) +
  geom_vline(xintercept = 0.151, linetype="dashed") +
  theme_classic() +
  scale_y_continuous(expand = c(0, 0)) +
  scale_x_continuous(expand = c(0, 0)) +
  labs(x = "% using PrEP", y = "% LAI-PrEP among all PrEP", fill = "PIA") +
  scale_fill_viridis(discrete = FALSE, alpha = 1, option = "D", direction = -1,
                     breaks = c(-0.1, 0.0, 0.1, 0.2, 0.3, 0.4, 0.5),
                     labels = c("-10%", "0%","10%","20%","30%","40%", "50%")) +
  theme(legend.position = "right",
        axis.text = element_text(size = 9, colour = "black"),
        axis.title = element_text(size = 11),
        legend.text = element_text(size = 9),
        legend.title = element_text(size = 10),
        axis.ticks.length = unit(0.25, "cm"),
        axis.ticks = element_line(color = "black"))
