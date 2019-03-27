
## Calibrate Starting PrEP Level

load("data/sim.n605.rda")

sim$param$prep.start.prob

# df <- as.data.frame(sim)
# names(df)
# plot(sim, y = "prepCurr")

sim <- mutate_epi(sim, pFrac = prepCurr / prepElig)

plot(sim, y = "pFrac")
abline(v = 52*5, h = 0.15, lty = 2)

stat <- as.numeric(sim$epi$pFrac[52*5, ])
summary(stat)

# Final selected model

# data/sim.n605.rda
# sim$param$prep.start.prob
# [1] 0.21
# summary(stat)
# Min.    1st Qu. Median  Mean    3rd Qu. Max.
# 0.1362  0.1462  0.1494  0.1495  0.1530  0.1637
