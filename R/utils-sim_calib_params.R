library(EpiModelHIV)

orig <- readRDS("out/est/netest.rds")
netstats <- readRDS("out/est/netstats.rds")
epistats <- readRDS("out/est/epistats.rds")

full_tx_eff <- rep(1, 3)

param <- param_msm(
  netstats = netstats,
  epistats = epistats,
  hiv.test.rate = c(0.00385, 0.00385, 0.0069),
  hiv.test.late.prob = rep(0, 3),
  tx.init.prob = c(0.1775, 0.19, 0.2521),
  tt.part.supp = 1 - full_tx_eff,
  tt.full.supp = full_tx_eff,
  tt.dur.supp = rep(0, 3),
  tx.halt.part.prob = c(0.0062, 0.0055, 0.0031),
  tx.halt.full.rr = rep(0.45, 3),
  tx.halt.dur.rr = rep(0.45, 3),
  tx.reinit.part.prob = rep(0.00255, 3),
  tx.reinit.full.rr = rep(1, 3),
  tx.reinit.dur.rr = rep(1, 3),
  max.time.off.tx.full.int = 52 * 15,
  max.time.on.tx.part.int = 52 * 10,
  max.time.off.tx.part.int = 52 * 10,
  aids.mr = 1 / 250,
  trans.scale = c(2.68, 0.4, 0.27), #c(2.21, 0.405, 0.255),
  acts.scale = 1.00,
  acts.aids.vl = 5.75,
  circ.prob = c(0.874, 0.874, 0.918),
  a.rate = 0.00052,
  prep.start = (52 * 60) + 1,
  riskh.start = 52 * 59,
  prep.adhr.dist = c(0.089, 0.127, 0.784),
  prep.adhr.hr = c(0.69, 0.19, 0.01),
  prep.start.prob =  0.71, # 0.00896,
  prep.discont.rate = 0.02138792,
  ## prep.tst.int = 90/7,         # do I need that?
  ## prep.risk.int = 182/7,       # do I need that?
  ## prep.sti.screen.int = 182/7,
  ## prep.sti.prob.tx = 1,
  prep.risk.reassess.method = "year",
  prep.require.lnt = TRUE, # FALSE -> start with random PrEP initiation

  # Injectable PrEP specific
  prep.la.start = Inf, #(52*60)+1,
  prepla.discont.rate = 1 - (2^(-1/781)),
  prep.prob.oral = 1,
  prep.inj.int = 8 * 7,

  prep.adhr.dist.la = c(0.215, 0.785), # only 2 adherence classes
  prepla.dlevel.icpt = 3.98,
  prepla.dlevel.icpt.err = 2,
  prepla.dlevel.halflife.int = 40,
  prep.la.hr.beta = -9.0599,
  prep.la.hr.rel = 1
)

## must be set by the calling script
if (lnt == FALSE) {
  param$prep.require.lnt = FALSE
  param$prep.start.prob = 0.00896
}

init <- init_msm(
  prev.ugc = 0,
  prev.rct = 0,
  prev.rgc = 0,
  prev.uct = 0
)
