library(EpiModelHIV)

orig <- readRDS("out/est/netest.rds")
netstats <- readRDS("out/est/netstats.rds")
epistats <- readRDS("out/est/epistats.rds")

full_tx_eff <- c(0.55, 0.60, 0.72) # .55 roughly gets 65% supp
ppi <- 0.5

param <- param_msm(
  netstats = netstats,
  epistats = epistats,
  hiv.test.rate = c(0.00432, 0.00425, 0.00730),
  hiv.test.late.prob = c(0, 0, 0),
  tx.init.prob = c(0.1775, 0.190, 0.2521),
  tt.part.supp = 1 - full_tx_eff,
  tt.full.supp = full_tx_eff,
  tt.dur.supp = c(0, 0, 0),
  tx.halt.part.prob = c(0.009, 0.0084, 0.00768),
  tx.halt.full.rr = c(0.45, 0.45, 0.45),
  tx.halt.dur.rr = c(0.45, 0.45, 0.45),
  tx.reinit.part.prob = c(0.0115, 0.0135, 0.0205),
  tx.reinit.full.rr = c(1, 1, 1),
  tx.reinit.dur.rr = c(1, 1, 1),
  max.time.off.tx.full.int = 52 * 15,
  max.time.on.tx.part.int = 52 * 10,
  max.time.off.tx.part.int = 52 * 10,
  aids.mr = 1/250,
  trans.scale = rep(10, 3), # c(2.64, 0.45, 0.285),
  acts.scale = 1.00,
  acts.aids.vl = 5.75,

  prep.start = 52 * 2, #(52*60)+1,
  riskh.start = 1, #52*59,
  prep.start.prob = 0.03, #0.66,
  prep.require.lnt = FALSE, #TRUE,
  prep.risk.reassess.method = "year",
  # params from test.burn.R
  prep.la.start = 52 * 5, #(52*60)+1,

  prep.prob.oral = 1 - ppi,

  prep.adhr.dist = c(0.089, 0.127, 0.785),
  prep.adhr.hr = c(0.69, 0.19, 0.02),

  prep.discont.rate = 1 - (2^(-1/781)),
  prepla.discont.rate = 1 - (2^(-1/781)),

  prep.inj.int = 8 * 7,

  prep.adhr.dist.la = c(0.215, 0.785), # only 2 adherence classes
  prepla.dlevel.icpt = 3.98,
  prepla.dlevel.icpt.err = 2,
  prepla.dlevel.halflife.int = 40,
  prep.la.hr.beta = -9.0599,
  prep.la.hr.rel = 1,

  prep.tst.int = 90,
  prep.risk.int = 182,

  prep.sti.screen.int = 182,
  prep.la.sti.screen.int = 121,
  prep.sti.prob.tx = 1
)

init <- init_msm(
  prev.ugc = 0,
  prev.rct = 0,
  prev.rgc = 0,
  prev.uct = 0
)

control <- control_msm(
  simno = 1,
  nsteps = 52*10,
  nsims = 1,
  ncores = 1,
  save.nwstats = FALSE,
  save.clin.hist = FALSE
)

sim <- netsim(orig, param, init, control)

df <- as.data.frame(sim)

library(ggplot2)
theme_set(theme_light())

ggplot(df, aes(x = time, y = waning_laprep)) +
  geom_line()

ggplot(df, aes(x = time, y = prepCurr)) +
  geom_line()

ggplot(df, aes(x = time, y = prep.laCurr)) +
  geom_line()

ggplot(df, aes(x = time, y = prep.laCurr / (prepCurr + prep.laCurr))) +
  geom_line()

ggplot(df, aes(x = time, y = incid)) +
  geom_line()

ggplot(df, aes(x = time, y = prep.rand.stop)) +
  geom_line()

ggplot(df, aes(x = time, y = prep.la.rand.stop)) +
  geom_line()

# testing!
ggplot(df, aes(x = time, y = tot.tests)) +
  geom_line()

# diags
ggplot(df, aes(x = time, y = cc.dx)) +
  geom_line()
