
## LA PrEP Exploratory

load("data/sim.n2000.rda")

df <- as.data.frame(sim)
names(df)

par(mar = c(3,3,1,1), mgp = c(2,1,0), mfrow = c(1,1))
plot(sim, y = "i.prev", ylim = c(0.1, 0.3), qnts = 0.5, mean.lwd = 1)
abline(h = 0.26, lty = 2)
text(x = 0, y = 0.28, round(mean(tail(df$i.prev, 100)), 3))

plot(sim, y = "ir100", mean.smooth = FALSE, mean.lwd = 1, ylim = c(0, 10))
abline(h = 3.4, lty = 2)
text(0, 1, round(mean(tail(df$ir100, 520)), 2))

plot(sim, y = "ir100", mean.smooth = TRUE, mean.lwd = 1.25, ylim = c(0, 10))
abline(h = 3.4, lty = 2)
text(0, 1, round(mean(tail(df$ir100, 520)), 2))

# ref and 15% LA supp

load("data/sim.n2000.rda")
ref <- sim

load("data/sim.n2010.rda")
cf <- sim

plot(ref, y = "ir100", ylim = c(0, 6))
abline(h = 3.4, lty = 2)
plot(cf, y = "ir100", add = TRUE,
     mean.col = "firebrick", qnts.col = "firebrick")

plot(ref, y = "i.prev", ylim = c(0, 0.3))
abline(h = 3.4, lty = 2)
plot(cf, y = "i.prev", add = TRUE,
     mean.col = "firebrick", qnts.col = "firebrick")


sims <- c(2000, 2030:2033)
p <- wesanderson::wes_palette("Zissou1", n = length(sims), type = "continuous")
for (j in sims) {
  fn <- paste0("data/sim.n", j, ".rda")
  load(fn)
  plot(sim, y = "ir100", qnts = FALSE, ylim = c(0, 4),
       mean.col = p[which(j == sims)],
       add = which(j == sims) > 1)
}


# make master df ----------------------------------------------------------

sims <- c(2000, 2030:2033)
d <- data.frame(covo = NA, covl = NA, ir100 = NA, i.prev = NA)
for (j in sims) {
  fn <- paste0("data/sim.n", j, ".rda")
  load(fn)

  df <- data.frame(covo = sim$param$prep.coverage,
                   covl = sim$param$prep.coverage.la,
                   ir100 = unname(colMeans(tail(sim$epi$ir100, 50))),
                   i.prev = as.numeric(tail(sim$epi$i.prev, 1)))

  d <- rbind(d, df)
}
d <- d[-1, ]
str(d)
table(d$covl)

p <- wesanderson::wes_palette("Zissou", n = length(unique(d$covl)), type = "continuous")
boxplot(ir100 ~ covl, data = d, outline = FALSE, col = p, medlwd = 1.5)
boxplot(i.prev ~ covl, data = d, outline = FALSE, col = p, medlwd = 1.5)

