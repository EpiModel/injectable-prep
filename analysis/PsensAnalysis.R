
# system("scp hyak:/gscratch/csde/sjenness/psens/data/*.rda data/")

library("EpiModel")
library("dplyr")
library("reshape2")
library("ggplot2")

nf <- function(d, l = 0.025, h = 0.975) round(quantile(d, c(0.5, l, h)), 3)


# Table outcomes ----------------------------------------------------------

list.files("data/")
load("data/sim.n1004.rda")
df <- as.data.frame(sim)

names(df)
df$prep.sens
df$prep.sens.ftime

# Meta results

prep.sens.all <- as.numeric(tail(sim$epi$prep.sens, 1))
prep.sens.1y <- as.numeric(tail(sim$epi$prep.sens.1y, 1))
prep.sens.2y <- as.numeric(tail(sim$epi$prep.sens.2y, 1))
prep.sens.3y <- as.numeric(tail(sim$epi$prep.sens.3y, 1))
prep.sens.4y <- as.numeric(tail(sim$epi$prep.sens.4y, 1))
prep.sens.5y <- as.numeric(tail(sim$epi$prep.sens.5y, 1))

nf(prep.sens.all)
nf(prep.sens.1y)
nf(prep.sens.2y)
nf(prep.sens.3y)
nf(prep.sens.4y)
nf(prep.sens.5y)

prep.spec.all <- as.numeric(tail(sim$epi$prep.spec, 1))
prep.spec.1y <- as.numeric(tail(sim$epi$prep.spec.1y, 1))
prep.spec.2y <- as.numeric(tail(sim$epi$prep.spec.2y, 1))
prep.spec.3y <- as.numeric(tail(sim$epi$prep.spec.3y, 1))
prep.spec.4y <- as.numeric(tail(sim$epi$prep.spec.4y, 1))
prep.spec.5y <- as.numeric(tail(sim$epi$prep.spec.5y, 1))

nf(prep.spec.all)
nf(prep.spec.1y)
nf(prep.spec.2y)
nf(prep.spec.3y)
nf(prep.spec.4y)
nf(prep.spec.5y)


# make master df ----------------------------------------------------------

d <- data.frame(indic = NA, meas = NA, timef = NA, out = NA)
for (j in 1000:1004) {
  fn <- paste0("data/sim.n", j, ".rda")
  load(fn)
  df <- as.data.frame(sim)
  for (i in 1:5) {
    sens.dat <- as.numeric(tail(sim$epi[[paste0("prep.sens.", i, "y")]], 1))
    new.d <- data.frame(indic = j, meas = "sens", timef = i, out = sens.dat)
    d <- rbind(d, new.d)
    spec.dat <- as.numeric(tail(sim$epi[[paste0("prep.spec.", i, "y")]], 1))
    new.d <- data.frame(indic = j, meas = "spec", timef = i, out = spec.dat)
    d <- rbind(d, new.d)
  }
}
d <- d[-1, ]
str(d)
table(d$indic)

# Code indications as 1:5
d$indic <- d$indic - 999


# Plots -------------------------------------------------------------------


## Sensitivity by indication

subd <- filter(d, indic == 1:4, meas == "sens")

pdf(file = "../Fig1.pdf", height = 6, width = 10)
ggplot(subd, aes(factor(timef), out)) +
  geom_violin(aes(fill = factor(indic))) +
  scale_fill_brewer(type = "qual", palette = "Set1") +
  labs(fill = "Indication") +
  ylab("Proportion") + xlab("Time Frame (Years)") +
  theme_linedraw()
dev.off()


# Specificity by indication

subd <- filter(d, indic == 1:4, meas == "spec")

pdf(file = "../Fig2.pdf", height = 6, width = 10)
ggplot(subd, aes(factor(timef), out)) +
  geom_violin(aes(fill = factor(indic))) +
  scale_fill_brewer(type = "qual", palette = "Set1") +
  ylab("Proportion") + xlab("Time Frame (Years)") +
  labs(fill = "Indication") +
  theme_linedraw()
dev.off()

# overall sens and spec

subd <- filter(d, indic == 5)

pdf(file = "../Fig3.pdf", height = 6, width = 10)
ggplot(subd, aes(factor(timef), out)) +
  geom_violin(aes(fill = factor(meas))) +
  scale_fill_brewer(type = "qual", palette = "Set1") +
  # ylim(0, 1) +
  ylab("Proportion") + xlab("Time Frame (Years)") +
  labs(fill = "Measure") +
  theme_linedraw()
dev.off()


# First/Last analysis -----------------------------------------------------

load("data/sim.n1000.rda")
df <- as.data.frame(sim)

prep.sens.ftime <- as.numeric(tail(sim$epi$prep.sens.ftime, 1))/52
prep.sens.ltime <- as.numeric(tail(sim$epi$prep.sens.ltime, 1))/52
prep.sens.dtime <- prep.sens.ftime - prep.sens.ltime
prep.sens.5y <- as.numeric(tail(sim$epi$prep.sens.5y, 1))

nf(prep.sens.5y)
nf(prep.sens.ftime)
nf(prep.sens.ltime)
nf(prep.sens.dtime)


load("data/sim.n1001.rda")
df <- as.data.frame(sim)

prep.sens.ftime <- as.numeric(tail(sim$epi$prep.sens.ftime, 1))/52
prep.sens.ltime <- as.numeric(tail(sim$epi$prep.sens.ltime, 1))/52
prep.sens.dtime <- prep.sens.ftime - prep.sens.ltime
prep.sens.5y <- as.numeric(tail(sim$epi$prep.sens.5y, 1))

nf(prep.sens.5y)
nf(prep.sens.ftime)
nf(prep.sens.ltime)
nf(prep.sens.dtime)


load("data/sim.n1002.rda")
df <- as.data.frame(sim)

prep.sens.ftime <- as.numeric(tail(sim$epi$prep.sens.ftime, 1))/52
prep.sens.ltime <- as.numeric(tail(sim$epi$prep.sens.ltime, 1))/52
prep.sens.dtime <- prep.sens.ftime - prep.sens.ltime
prep.sens.5y <- as.numeric(tail(sim$epi$prep.sens.5y, 1))

nf(prep.sens.5y)
nf(prep.sens.ftime)
nf(prep.sens.ltime)
nf(prep.sens.dtime)


load("data/sim.n1003.rda")
df <- as.data.frame(sim)

prep.sens.ftime <- as.numeric(tail(sim$epi$prep.sens.ftime, 1))/52
prep.sens.ltime <- as.numeric(tail(sim$epi$prep.sens.ltime, 1))/52
prep.sens.dtime <- prep.sens.ftime - prep.sens.ltime
prep.sens.5y <- as.numeric(tail(sim$epi$prep.sens.5y, 1))

nf(prep.sens.5y)
nf(prep.sens.ftime)
nf(prep.sens.ltime)
nf(prep.sens.dtime)


load("data/sim.n1004.rda")
df <- as.data.frame(sim)

prep.sens.ftime <- as.numeric(tail(sim$epi$prep.sens.ftime, 1))/52
prep.sens.ltime <- as.numeric(tail(sim$epi$prep.sens.ltime, 1))/52
prep.sens.dtime <- prep.sens.ftime - prep.sens.ltime
prep.sens.5y <- as.numeric(tail(sim$epi$prep.sens.5y, 1))

nf(prep.sens.5y)
nf(prep.sens.ftime)
nf(prep.sens.ltime)
nf(prep.sens.dtime)
