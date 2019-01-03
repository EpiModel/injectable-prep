
## Calibrate Starting PrEP Level

load("../../data/sim.n1002.rda")

sim$param$prep.start.prob

# df <- as.data.frame(sim)
# names(df)
# plot(sim, y = "prepCurr")

sim <- mutate_epi(sim, pFrac = prepCurr / prepElig)

plot(sim, y = "pFrac")
abline(v = 52*5)

stat <- as.numeric(sim$epi$pFrac[52*5, ])
summary(stat)
