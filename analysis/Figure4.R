rm(list = ls())
library("EpiModelHIV")
library("EpiModelHPC")

library("tidyverse")

library("viridis")
library("gridExtra")
library("ggpubr")


# Process Data --------------------------------------------------------

sim.base <- readRDS("data/sim_2001.rds")
incid.base <- unname(colSums(sim.base$epi$incid))

sims <- c(5000:5007, 2013)

for (i in seq_along(sims)) {
  fn <- list.files("data/", pattern = as.character(sims[i]), full.names = TRUE)
  sim <- readRDS(fn)

  # % on PrEP among indicated men

  sim <- mutate_epi(sim, percPrEP.ind.o = prepCurr / prepElig)
  sim <- mutate_epi(sim, percPrEP.ind.i = prepCurr.8w.la / prepElig.la)
  sim <- mutate_epi(sim, percPrEP.ind.w = waning_laprep / prepElig.la)

  percP.ind.o <- as.numeric(colMeans(tail(sim$epi$percPrEP.ind.o, 52)))
  percP.ind.i <- as.numeric(colMeans(tail(sim$epi$percPrEP.ind.i, 52)))
  percP.ind.w <- as.numeric(colMeans(tail(sim$epi$percPrEP.ind.w, 52)))

  prev <- as.numeric(tail(sim$epi$i.prev, 1))
  ir <- as.numeric(colMeans(tail(sim$epi$ir100), 52))

  incid.comp <- unname(colSums(sim$epi$incid))

  nia <- incid.base - incid.comp
  pia <- nia/incid.base

  new.df <- data.frame(scen = sims[i],
                       relhr = sim$param$prep.la.hr.rel,
                       percP.o = percP.ind.o,
                       percP.i = percP.ind.i,
                       percP.w = percP.ind.w,
                       prev = prev,
                       ir = ir,
                       pia = pia
  )

  if (i == 1) {
    fig.df <- new.df
  } else {
    fig.df <- rbind(fig.df, new.df)
  }

  cat("*")
}
#Placing the base case in the middle
fig.df$scen[fig.df$scen == 2013] <- 5003.5

fig.df$relhr.lab <- NULL
fig.df$relhr.lab[fig.df$scen == 5007] <- "50%\nDecrease"
fig.df$relhr.lab[fig.df$scen == 5006] <- "25%\nDecrease"
fig.df$relhr.lab[fig.df$scen == 5005] <- "10%\nDecrease"
fig.df$relhr.lab[fig.df$scen == 5004] <- "5%\nDecrease"
fig.df$relhr.lab[fig.df$scen == 5003.5] <- "Base\nModel"
fig.df$relhr.lab[fig.df$scen == 5003] <- "5%\nIncrease"
fig.df$relhr.lab[fig.df$scen == 5002] <- "10%\nIncrease"
fig.df$relhr.lab[fig.df$scen == 5001] <- "25%\nIncrease"
fig.df$relhr.lab[fig.df$scen == 5000] <- "50%\nIncrease"

fig.df$pia.100 <- fig.df$pia * 100
fig.df$percP.i.100 <- fig.df$percP.i * 100
fig.df$percP.w.100 <- fig.df$percP.w * 100

xlab <- "Relative change in LAI-PrEP hazard-ratio"
par(mar = c(3,3,2,1), mgp = c(2,1,0))
pal <- viridis::viridis(n = 1, alpha = 0.75, begin = 0.5)

fig.ir <- ggplot(fig.df,
                 aes(x = reorder(relhr.lab, -scen), y = ir)) +
  geom_boxplot(fill = pal, outlier.shape = NA) +
  theme_classic() +
  labs(x = xlab,
       y = "HIV incidence rate") +
  theme(axis.text = element_text(size = 9, colour = "black"),
        axis.title = element_text(size = 11),
        axis.ticks.length = unit(0.25, "cm"),
        axis.ticks = element_line(color = "black"))
fig.ir

fig.pia <- ggplot(fig.df,
                  aes(x = reorder(relhr.lab, -scen), y = pia.100)) +
  geom_boxplot(fill = pal, outlier.shape = NA) +
  theme_classic() +
  labs(x = xlab,
       y = "PIA") +
  theme(axis.text = element_text(size = 9, colour = "black"),
        axis.title = element_text(size = 11),
        axis.ticks.length = unit(0.25, "cm"),
        axis.ticks = element_line(color = "black"))
fig.pia

ggarrange(fig.ir, fig.pia,
          labels = c("A", "B"),
          ncol = 1, nrow = 2)

# pdf(file = "analysis/Figure4.pdf", height = 6.0, width = 8.0)

# ggarrange(fig.ir, fig.pia,
#           labels = c("A", "B"),
#           ncol = 2, nrow = 1)
