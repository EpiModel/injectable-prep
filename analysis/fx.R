
## PrEP Functions

epi_stats <- function(sim.base,
                      sim.comp = NULL,
                      at = 520,
                      qnt.low = 0.025,
                      qnt.high = 0.975) {

  # Base scenario -------------------------------------------------------

  # % on PrEP

  # Among all men

  sim.base <- mutate_epi(sim.base, percPrEP.o = prepCurr / num)
  sim.base <- mutate_epi(sim.base, percPrEP.i = prepCurr.8w.la / num)
  sim.base <- mutate_epi(sim.base, percPrEP.w = waning_laprep / num)

  percP.o <- as.numeric(colMeans(tail(sim.base$epi$percPrEP.o, 52)))
  percP.base.o <- round(data.frame(median = median(percP.o),
                                   ql = quantile(percP.o, qnt.low, names = FALSE),
                                   qu = quantile(percP.o, qnt.high, names = FALSE)), 3)

  percP.i <- as.numeric(colMeans(tail(sim.base$epi$percPrEP.i, 52)))
  percP.base.i <- round(data.frame(median = median(percP.i),
                                   ql = quantile(percP.i, qnt.low, names = FALSE),
                                   qu = quantile(percP.i, qnt.high, names = FALSE)), 3)

  percP.w <- as.numeric(colMeans(tail(sim.base$epi$percPrEP.w, 52)))
  percP.base.w <- round(data.frame(median = median(percP.w),
                                   ql = quantile(percP.w, qnt.low, names = FALSE),
                                   qu = quantile(percP.w, qnt.high, names = FALSE)), 3)

  # Among PrEP indicated men

  sim.base <- mutate_epi(sim.base, percPrEP.ind.o = prepCurr / prepElig)
  sim.base <- mutate_epi(sim.base, percPrEP.ind.i = prepCurr.8w.la / prepElig.la)
  sim.base <- mutate_epi(sim.base, percPrEP.ind.w = waning_laprep / prepElig.la)

  percP.ind.o <- as.numeric(colMeans(tail(sim.base$epi$percPrEP.ind.o, 52)))
  percP.ind.base.o <- round(data.frame(median = median(percP.ind.o),
                                       ql = quantile(percP.ind.o, qnt.low, names = FALSE),
                                       qu = quantile(percP.ind.o, qnt.high, names = FALSE)), 3)

  percP.ind.i <- as.numeric(colMeans(tail(sim.base$epi$percPrEP.ind.i, 52)))
  percP.ind.base.i <- round(data.frame(median = median(percP.ind.i),
                                       ql = quantile(percP.ind.i, qnt.low, names = FALSE),
                                       qu = quantile(percP.ind.i, qnt.high, names = FALSE)), 3)

  percP.ind.w <- as.numeric(colMeans(tail(sim.base$epi$percPrEP.ind.w, 52)))
  percP.ind.base.w <- round(data.frame(median = median(percP.ind.w),
                                       ql = quantile(percP.ind.w, qnt.low, names = FALSE),
                                       qu = quantile(percP.ind.w, qnt.high, names = FALSE)), 3)

  # HIV prevalence

  i.prev <- as.numeric(sim.base$epi$i.prev[at, ])
  prev.base <- round(data.frame(median = median(i.prev),
                                ql = quantile(i.prev, qnt.low, names = FALSE),
                                qu = quantile(i.prev, qnt.high, names = FALSE)), 3)

  # Overall incidence

  haz <- as.numeric(colMeans(tail(sim.base$epi$ir100, 52)))
  haz.base <- round(data.frame(median = median(haz),
                               ql = quantile(haz, qnt.low, names = FALSE),
                               qu = quantile(haz, qnt.high, names = FALSE)), 2)

  incid.base <- unname(colSums(sim.base$epi$incid))

  # Comparison scenario -------------------------------------------------

  if (!is.null(sim.comp)) {

    # % on PrEP among all men

    sim.comp <- mutate_epi(sim.comp, percPrEP.o = prepCurr / num)
    sim.comp <- mutate_epi(sim.comp, percPrEP.i = prepCurr.8w.la / num)
    sim.comp <- mutate_epi(sim.comp, percPrEP.w = waning_laprep / num)

    percP.o <- as.numeric(colMeans(tail(sim.comp$epi$percPrEP.o, 52)))
    out.percP.o <- round(data.frame(median = median(percP.o),
                                    ql = quantile(percP.o, qnt.low, names = FALSE),
                                    qu = quantile(percP.o, qnt.high, names = FALSE)), 3)

    percP.i <- as.numeric(colMeans(tail(sim.comp$epi$percPrEP.i, 52)))
    out.percP.i <- round(data.frame(median = median(percP.i),
                                    ql = quantile(percP.i, qnt.low, names = FALSE),
                                    qu = quantile(percP.i, qnt.high, names = FALSE)), 3)

    percP.w <- as.numeric(colMeans(tail(sim.comp$epi$percPrEP.w, 52)))
    out.percP.w <- round(data.frame(median = median(percP.w),
                                    ql = quantile(percP.w, qnt.low, names = FALSE),
                                    qu = quantile(percP.w, qnt.high, names = FALSE)), 3)

    # % on PrEP among indicated men

    sim.comp <- mutate_epi(sim.comp, percPrEP.ind.o = prepCurr / prepElig)
    sim.comp <- mutate_epi(sim.comp, percPrEP.ind.i = prepCurr.8w.la / prepElig.la)
    sim.comp <- mutate_epi(sim.comp, percPrEP.ind.w = waning_laprep / prepElig.la)

    percP.ind.o <- as.numeric(colMeans(tail(sim.comp$epi$percPrEP.ind.o, 52)))
    out.percP.ind.o <- round(data.frame(median = median(percP.ind.o),
                                        ql = quantile(percP.ind.o, qnt.low, names = FALSE),
                                        qu = quantile(percP.ind.o, qnt.high, names = FALSE)), 3)

    percP.ind.i <- as.numeric(colMeans(tail(sim.comp$epi$percPrEP.ind.i, 52)))
    out.percP.ind.i <- round(data.frame(median = median(percP.ind.i),
                                        ql = quantile(percP.ind.i, qnt.low, names = FALSE),
                                        qu = quantile(percP.ind.i, qnt.high, names = FALSE)), 3)

    percP.ind.w <- as.numeric(colMeans(tail(sim.comp$epi$percPrEP.ind.w, 52)))
    out.percP.ind.w <- round(data.frame(median = median(percP.ind.w),
                                        ql = quantile(percP.ind.w, qnt.low, names = FALSE),
                                        qu = quantile(percP.ind.w, qnt.high, names = FALSE)), 3)


    # Prevalence

    i.prev <- as.numeric(sim.comp$epi$i.prev[at, ])
    out.prev <- round(data.frame(median = median(i.prev),
                                 ql = quantile(i.prev, qnt.low, names = FALSE),
                                 qu = quantile(i.prev, qnt.high, names = FALSE)), 3)
    # Overall incidence

    haz <- as.numeric(colMeans(tail(sim.comp$epi$ir100, 52)))
    out.haz <- round(data.frame(median = median(haz),
                                ql = quantile(haz, qnt.low, names = FALSE),
                                qu = quantile(haz, qnt.high, names = FALSE)), 2)

    # NIA

    incid.comp <- unname(colSums(sim.comp$epi$incid))
    vec.nia <- incid.base - incid.comp

    # PIA

    vec.pia <- vec.nia/incid.base
    out.pia <- round(data.frame(median = median(vec.pia),
                                ql = quantile(vec.pia, qnt.low, names = FALSE),
                                qu = quantile(vec.pia, qnt.high, names = FALSE)), 3)

    cat("\nPercent on oral PrEP - all men:")
    print(t(out.percP.o))

    cat("\nPercent on inj PrEP - all men:")
    print(t(out.percP.i))

    cat("\nPercent waning inj PrEP - all men:")
    print(t(out.percP.w))

    cat("\nPercent on oral PrEP - indicated:")
    print(t(out.percP.ind.o))

    cat("\nPercent on inj PrEP - indicated:")
    print(t(out.percP.ind.i))

    cat("\nPercent waning inj PrEP - indicated:")
    print(t(out.percP.ind.w))

    cat("\nHIV Prevalence:")
    print(t(out.prev))

    cat("\nHIV Incidence:")
    print(t(out.haz))

    cat("\nHIV PIA:")
    print(t(out.pia))

  } else {

    cat("\nPercent on oral PrEP - all men:")
    print(t(percP.base.o))

    cat("\nPercent on inj PrEP - all men:")
    print(t(percP.base.i))

    cat("\nPercent waning inj PrEP - all men:")
    print(t(percP.base.w))

    cat("\nPercent on oral PrEP - indicated:")
    print(t(percP.ind.base.o))

    cat("\nPercent on inj PrEP - indicated:")
    print(t(percP.ind.base.i))

    cat("\nPercent waning inj PrEP - indicated:")
    print(t(percP.ind.base.w))

    cat("\nHIV Prevalence:")
    print(t(prev.base))

    cat("\nHIV Incidence:")
    print(t(haz.base))

  }

}

