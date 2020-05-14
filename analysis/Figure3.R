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

sims <- 6000:6008

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
                       disc.rate = sim$param$prepla.discont.rate,
                       percP.o = percP.ind.o,
                       percP.i = percP.ind.i,
                       percP.w = percP.ind.w,
                       prev = prev,
                       ir = ir,
                       pia = pia
  )

  if (i == 1) {
    fig3.df <- new.df
  } else {
    fig3.df <- rbind(fig3.df, new.df)
  }

  cat("*")
}

fig3.df$days <- NULL
fig3.df$days[fig3.df$scen == 6000] <- "1/3x\n75"
fig3.df$days[fig3.df$scen == 6001] <- "1/2.5x\n90"
fig3.df$days[fig3.df$scen == 6002] <- "1/2x\n112"
fig3.df$days[fig3.df$scen == 6003] <- "1/1.5x\n149"
fig3.df$days[fig3.df$scen == 6004] <- "1x\n224"
fig3.df$days[fig3.df$scen == 6005] <- "1.5x\n336"
fig3.df$days[fig3.df$scen == 6006] <- "2x\n448"
fig3.df$days[fig3.df$scen == 6007] <- "2.5x\n560"
fig3.df$days[fig3.df$scen == 6008] <- "3x\n672"

xlab <- "Median days to spontaneous discontinuation of LAI-PrEP"

fig3.df$pia.100 <- fig3.df$pia * 100
fig3.df$percP.i.100 <- fig3.df$percP.i * 100
fig3.df$percP.w.100 <- fig3.df$percP.w * 100

par(mar = c(3,3,2,1), mgp = c(2,1,0))

pal <- viridis::viridis(n = 1, alpha = 0.75, begin = 0.5)

fig3.i <- ggplot(fig3.df,
        aes(x = reorder(days, scen), y = percP.i.100)) +
        geom_boxplot(fill = pal, outlier.shape = NA) +
        theme_classic() +
        labs(x = xlab,
             y = "% using LAI-PrEP") +
        theme(axis.text = element_text(size = 9, colour = "black"),
              axis.title = element_text(size = 11),
              axis.ticks.length = unit(0.25, "cm"),
              axis.ticks = element_line(color = "black"))

fig3.w <- ggplot(fig3.df,
        aes(x = reorder(days, scen), y = percP.w.100)) +
        geom_boxplot(fill = pal, outlier.shape = NA) +
        theme_classic() +
        labs(x = xlab,
             y = "% waning LAI-PrEP") +
        theme(axis.text = element_text(size = 9, colour = "black"),
              axis.title = element_text(size = 11),
              axis.ticks.length = unit(0.25, "cm"),
              axis.ticks = element_line(color = "black"))

fig3.ir <- ggplot(fig3.df,
        aes(x = reorder(days, scen), y = ir)) +
        geom_boxplot(fill = pal, outlier.shape = NA) +
        theme_classic() +
        labs(x = xlab,
             y = "HIV Incidence Rate") +
        theme(axis.text = element_text(size = 9, colour = "black"),
              axis.title = element_text(size = 11),
              axis.ticks.length = unit(0.25, "cm"),
              axis.ticks = element_line(color = "black"))

fig3.pia <- ggplot(fig3.df,
        aes(x = reorder(days, scen), y = pia.100)) +
        geom_boxplot(fill = pal, outlier.shape = NA) +
        theme_classic() +
        labs(x = xlab,
             y = "PIA") +
        theme(axis.text = element_text(size = 9, colour = "black"),
              axis.title = element_text(size = 11),
              axis.ticks.length = unit(0.25, "cm"),
              axis.ticks = element_line(color = "black"))

ggarrange(fig3.i, fig3.w, fig3.ir, fig3.pia,
         labels = c("A", "B", "C", "D"),
         ncol = 2, nrow = 2)
