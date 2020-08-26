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

sims <- c(6000:6003, 2013, 6005:6008)

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
    fig.df <- new.df
  } else {
    fig.df <- rbind(fig.df, new.df)
  }

  cat("*")
}

fig.df$days <- NULL
fig.df$days[fig.df$scen == 6000] <- "1/3x\n75"
fig.df$days[fig.df$scen == 6001] <- "1/2.5x\n90"
fig.df$days[fig.df$scen == 6002] <- "1/2x\n112"
fig.df$days[fig.df$scen == 6003] <- "1/1.5x\n149"
fig.df$days[fig.df$scen == 2013] <- "1x\n224"
fig.df$days[fig.df$scen == 6005] <- "1.5x\n336"
fig.df$days[fig.df$scen == 6006] <- "2x\n448"
fig.df$days[fig.df$scen == 6007] <- "2.5x\n560"
fig.df$days[fig.df$scen == 6008] <- "3x\n672"

# Used 2013 for consistency with other analyses, but 6004 has same parameters
fig.df$scen[fig.df$scen == 2013] <- 6004

fig.df$pia.100 <- fig.df$pia * 100
fig.df$percP.i.100 <- fig.df$percP.i * 100
fig.df$percP.w.100 <- fig.df$percP.w * 100

fig.df2 <- fig.df %>% filter(scen == 6000 | scen == 6002 | scen == 6004 | scen == 6006 | scen == 6008)

xlab <- "Median days to discontinuation"
par(mar = c(3,3,2,1), mgp = c(2,1,0))
pal <- viridis::viridis(n = 1, alpha = 0.75, begin = 0.5)

fig.i <- ggplot(fig.df2,
        aes(x = reorder(days, scen), y = percP.i.100)) +
        geom_boxplot(fill = pal, outlier.shape = NA) +
        theme_classic() +
        labs(x = xlab,
             y = "% using LAI-PrEP") +
        theme(axis.text = element_text(size = 9, colour = "black"),
              axis.title = element_text(size = 11),
              axis.ticks.length = unit(0.25, "cm"),
              axis.ticks = element_line(color = "black"))

fig.w <- ggplot(fig.df2,
        aes(x = reorder(days, scen), y = percP.w.100)) +
        geom_boxplot(fill = pal, outlier.shape = NA) +
        theme_classic() +
        labs(x = xlab,
             y = "% waning LAI-PrEP") +
        theme(axis.text = element_text(size = 9, colour = "black"),
              axis.title = element_text(size = 11),
              axis.ticks.length = unit(0.25, "cm"),
              axis.ticks = element_line(color = "black"))

fig.ir <- ggplot(fig.df2,
        aes(x = reorder(days, scen), y = ir)) +
        geom_boxplot(fill = pal, outlier.shape = NA) +
        theme_classic() +
        labs(x = xlab,
             y = "HIV incidence rate") +
        theme(axis.text = element_text(size = 9, colour = "black"),
              axis.title = element_text(size = 11),
              axis.ticks.length = unit(0.25, "cm"),
              axis.ticks = element_line(color = "black"))

fig.pia <- ggplot(fig.df2,
        aes(x = reorder(days, scen), y = pia.100)) +
        geom_boxplot(fill = pal, outlier.shape = NA) +
        theme_classic() +
        labs(x = xlab,
             y = "PIA") +
        theme(axis.text = element_text(size = 9, colour = "black"),
              axis.title = element_text(size = 11),
              axis.ticks.length = unit(0.25, "cm"),
              axis.ticks = element_line(color = "black"))

ggarrange(fig.i, fig.w, fig.ir, fig.pia,
         labels = c("A", "B", "C", "D"),
         ncol = 2, nrow = 2)

# pdf(file = "analysis/Figure3.pdf", height = 6.0, width = 6.0)
