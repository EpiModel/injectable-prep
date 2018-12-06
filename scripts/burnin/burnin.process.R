
## Process burn-in
suppressMessages(library("EpiModelHIV"))


list.files("data/")
unlink("data/*.rda")

# Qualitative -------------------------------------------------------------

load("data/sim.n1000.rda")

df <- as.data.frame(sim)

par(mar = c(3,3,1,1), mgp = c(2,1,0), mfrow = c(1,1))
plot(sim, y = "i.prev", ylim = c(0.1, 0.3), qnts = 0.5, mean.lwd = 1)
abline(h = 0.26, lty = 2)
text(x = 0, y = 0.28, round(mean(tail(df$i.prev, 100)), 3))

plot(sim, y = "ir100.gc", mean.smooth = FALSE, mean.lwd = 1, ylim = c(0, 10))
abline(h = 4.2, lty = 2)
text(0, 1, round(mean(tail(df$ir100.gc, 520)), 2))

plot(sim, y = "ir100.ct", mean.smooth = FALSE, mean.lwd = 1, ylim = c(0, 10))
abline(h = 6.6, lty = 2)
text(0, 1, round(mean(tail(df$ir100.ct, 520)), 2))

plot(sim, y = "ir100", mean.smooth = FALSE, mean.lwd = 1, ylim = c(0, 10))
abline(h = 3.4, lty = 2)
text(0, 1, round(mean(tail(df$ir100, 520)), 2))


# Distance Statistics -----------------------------------------------------

# Merge sim files
sim <- merge_simfiles(simno = 1024, indir = "data/", ftype = "max")

# Create function for selecting sim closest to target
mean_sim <- function(sim, targets) {

  nsims <- sim$control$nsims

  # Initialize distance vector
  dist <- rep(NA, nsims)

  # Obtain statistics and perform multivariable Euclidean distance calculation
  for (i in 1:nsims) {

      # Create data frame to draw statistics from
      df <- as.data.frame(x = sim, out = "vals", sim = i)

      # Create a vector of statistics
      calib <- c(mean(tail(df$ir100.gc, 52)),
                 mean(tail(df$ir100.ct, 52)),
                 mean(tail(df$ir100, 52)))

      wts <- c(1, 1, 1)

      # Iteratively calculate distance
      dist[i] <- sqrt(sum(((calib - targets)*wts)^2))
  }

  # Which sim minimizes distance
  meansim <- which.min(dist)
  return(meansim)
}

# Run function
mean_sim(sim, targets = c(4.2, 6.6, 3.4))


# Save burn-in file for FU sims
sim <- get_sims(sim, sims = 44)
mean(tail(as.data.frame(sim)$ir100, 52))
mean(tail(as.data.frame(sim)$ir100.gc, 52))
mean(tail(as.data.frame(sim)$ir100.ct, 52))


save(sim, file = "est/lap.burnin.rda")

