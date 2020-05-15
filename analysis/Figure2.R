rm(list = ls())
library("EpiModelHIV")
library("EpiModelHPC")

library("dplyr")

library("ggplot2")
library("viridis")
library("gridExtra")

# Processing Data

sim.base <- readRDS("data/sim_2001.rds")
incid.base <- unname(colSums(sim.base$epi$incid))

sims <- 4000:4109

for (i in seq_along(sims)) {
  fn <- list.files("data/", pattern = as.character(sims[i]), full.names = TRUE)
  sim <- readRDS(fn)

  prev <- as.numeric(tail(sim$epi$i.prev, 1))
  ir <- as.numeric(colMeans(tail(sim$epi$ir100), 52))

  incid.comp <- unname(colSums(sim$epi$incid))

  nia <- incid.base - incid.comp
  pia <- nia/incid.base

  new.df <- data.frame(scen = sims[i],
                        picpt = sim$param$prepla.dlevel.icpt,
                        phalf = sim$param$prepla.dlevel.halflife.int,
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

df <- df %>% mutate(
  phalf.days = phalf * 7,
  pia.100 = pia * 100)

nrow(df)

table(df$picpt)
table(df$phalf.days)
table(df$picpt, df$phalf.days)

# min(df$picpt) # [1] 1.5
# max(df$picpt) # [1] 6.5

# min(df$phalf.days) # [1] 15
# max(df$phalf.days) # [1] 60

## PIA
fit.loess <- loess(pia.100 ~ picpt * phalf.days, data = df)
preds.loess <- expand.grid(list(picpt = seq(1.5, 6.5, 0.01),
                                 phalf.days = seq(15, 60, 0.01)))
preds.loess$pia.100 <- as.numeric(predict(fit.loess, newdata = preds.loess))

ggplot(preds.loess, aes(picpt, phalf.days)) +
  geom_raster(aes(fill = pia.100), interpolate = TRUE) +
  geom_contour(aes(z = pia.100), col = "white", alpha = 0.5, lwd = 0.5) +
  geom_hline(yintercept = 35, linetype = "dashed", col = "white") +
  geom_vline(xintercept = 3.59, linetype = "dashed", col = "white") +
  theme_classic() +
  scale_y_continuous(expand = c(0, 0)) +
  scale_x_continuous(expand = c(0, 0)) +
  labs(y = "Half-life (Days)", x = "Peak Plasma Concentration (ug/ml)", fill = "PIA") +
  scale_fill_viridis(discrete = FALSE, alpha = 1, option = "magma", direction = -1,
                     breaks = c(1, 2, 3, 4, 5, 6, 7),
                     labels = c("1%","2%","3%","4%","5%","6%", "7%")) +
  theme(legend.position = "right",
       axis.text = element_text(size = 9, colour = "black"),
       axis.title = element_text(size = 11),
       legend.text = element_text(size = 9),
       legend.title = element_text(size = 10),
       axis.ticks.length = unit(0.25, "cm"),
       axis.ticks = element_line(color = "black"))

pdf(file = "analysis/Figure2.pdf", height = 5.0, width = 4.0)
