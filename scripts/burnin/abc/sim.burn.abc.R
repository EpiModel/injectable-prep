
library("methods")
suppressMessages(library("EpiModelHIV"))
suppressMessages(library("doParallel"))
suppressMessages(library("foreach"))
suppressMessages(library("EasyABC"))

f <- function(x) {

  set.seed(x[1])

  suppressMessages(library("EpiModelHIV"))

  load("est/nwstats.rda")
  load("est/fit.rda")

  param <- param_msm(
                     ai.scale.BB = x[2],
                     ai.scale.BW = x[2],
                     ai.scale.WW = x[2],

                     rgc.tprob = x[3],
                     ugc.tprob = x[4],
                     rct.tprob = x[5],
                     uct.tprob = x[6],

                     rgc.ntx.int = x[7],
                     ugc.ntx.int = x[7],
                     rct.ntx.int = x[8],
                     uct.ntx.int = x[8],

                     hiv.rgc.rr = x[9],
                     hiv.ugc.rr = x[10],
                     hiv.rct.rr = x[9],
                     hiv.uct.rr = x[10],

                     nwstats = st,
                     race.method = 1,
                     riskh.start = 2500,
                     prep.start = Inf,
                     prep.la.start = Inf,
                     prep.replace.mod = "all",
                     prep.class.hr = c(0.69, 0.19, 0.02),
                     prep.coverage = 0.2,
                     prep.coverage.la = 0.1,
                     prep.adhr.dist = c(0.089, 0.127, 0.785),
                     prep.adhr.dist.la = c(0.20, 0.80),
                     prep.discont.rate = 1-(2^(-1/781)),
                     prep.hadr.int = 8 * 7,
                     prep.ladr.int = 16 * 7,
                     prepla.dlevel.icpt = 4.5,
                     prepla.dlevel.icpt.err = 2.5/3,
                     prepla.dlevel.slope = 25,
                     prep.la.hr = c(0.75, 0.50, 0.02),
                     prep.tst.int = 90,
                     prep.risk.int = 182,
                     prep.risk.reassess.method = "year",
                     rcomp.prob = 0.41,
                     rcomp.adh.groups = 2:3,
                     rcomp.main.only = FALSE,
                     rcomp.discl.only = FALSE,
                     rgc.sympt.prob = 0.16,
                     ugc.sympt.prob = 0.90,
                     rct.sympt.prob = 0.14,
                     uct.sympt.prob = 0.58,
                     gc.sympt.prob.tx.B = 0.85,
                     gc.sympt.prob.tx.W = 0.85,
                     ct.sympt.prob.tx.B = 0.90,
                     ct.sympt.prob.tx.W = 0.90,
                     gc.asympt.prob.tx.B = 0.10,
                     gc.asympt.prob.tx.W = 0.10,
                     ct.asympt.prob.tx.B = 0.15,
                     ct.asympt.prob.tx.W = 0.15)

  init <- init_msm(nwstats = st)

  control <- control_msm(simno = 1,
                         nsteps = 2600,
                         nsims = 1,
                         ncores = 1,
                         verbose = FALSE)

  sim <- netsim(est, param, init, control)

  df <- tail(as.data.frame(sim), 500)

  gc.incid1 <- mean(df$ir100.gc[1:100])
  gc.incid2 <- mean(df$ir100.gc[101:200])
  gc.incid3 <- mean(df$ir100.gc[201:300])
  gc.incid4 <- mean(df$ir100.gc[301:400])
  gc.incid5 <- mean(df$ir100.gc[401:500])

  ct.incid1 <- mean(df$ir100.ct[1:100])
  ct.incid2 <- mean(df$ir100.ct[101:200])
  ct.incid3 <- mean(df$ir100.ct[201:300])
  ct.incid4 <- mean(df$ir100.ct[301:400])
  ct.incid5 <- mean(df$ir100.ct[401:500])

  hiv.prev1 <- mean(df$i.prev[100:250])
  hiv.prev2 <- mean(df$i.prev[250:500])

  out <- c(gc.incid1, gc.incid2, gc.incid3, gc.incid4, gc.incid5,
           ct.incid1, ct.incid2, ct.incid3, ct.incid4, ct.incid5,
           hiv.prev1, hiv.prev2)

  return(out)
}

priors <- list(c("unif", 1.05, 1.1),
               c("unif", 0.35, 0.42),
               c("unif", 0.28, 0.34),
               c("unif", 0.20, 0.35),
               c("unif", 0.17, 0.22),
               c("unif", 220, 250),
               c("unif", 250, 300),
               c("unif", 2.7, 2.8),
               c("unif", 1.7, 1.8))

targets = c(4.2, 4.2, 4.2, 4.2, 4.2,
            6.6, 6.6, 6.6, 6.6, 6.6,
            0.26, 0.26)

a <- ABC_sequential(method = "Lenormand",
                    model = f,
                    prior = priors,
                    nb_simul = 120,
                    summary_stat_target = targets,
                    p_acc_min = 0.05,
                    progress_bar = TRUE,
                    n_cluster = 16,
                    use_seed = TRUE,
                    verbose = FALSE)

save(a, file = "data/lap.abc8.rda")

