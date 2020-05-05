
rm(list = ls())
library("EpiModelHIV")
library("dplyr")

library("ggplot2")
library("viridis")
library("gridExtra")

source("analysis/fx.R")


# Process Data --------------------------------------------------------

load("data/f1/sim.n2500.rda")
sim.base <- sim
incid.base <- unname(colSums(sim.base$epi$incid))

sims <- 2501:2940

for (i in seq_along(sims)) {
  fn <- list.files("data/f1", pattern = as.character(sims[i]), full.names = TRUE)
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
  labs(y = "Injectable PrEP", x = "PrEP Uptake") +
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
