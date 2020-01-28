


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
