
## PrEP Race Functions

epi_stats <- function(sim.base,
                      sim.comp = NULL,
                      at = 520,
                      qnt.low = 0.025,
                      qnt.high = 0.975) {

  # Base scenario -------------------------------------------------------

  # prevalence
  i.prev.W <- as.numeric(sim.base$epi$i.prev.W[at, ])
  prev.base.W <- round(data.frame(median = median(i.prev.W),
                                  ql = quantile(i.prev.W, qnt.low, names = FALSE),
                                  qu = quantile(i.prev.W, qnt.high, names = FALSE)), 3)

  i.prev.B <- as.numeric(sim.base$epi$i.prev.B[at, ])
  prev.base.B <- round(data.frame(median = median(i.prev.B),
                                  ql = quantile(i.prev.B, qnt.low, names = FALSE),
                                  qu = quantile(i.prev.B, qnt.high, names = FALSE)), 3)

  # incidence
  haz.W <- as.numeric(colMeans(tail(sim.base$epi$ir100.W, 52)))
  haz.base.W <- round(data.frame(median = median(haz.W),
                                 ql = quantile(haz.W, qnt.low, names = FALSE),
                                 qu = quantile(haz.W, qnt.high, names = FALSE)), 2)

  haz.B <- as.numeric(colMeans(tail(sim.base$epi$ir100.B, 52)))
  haz.base.B <- round(data.frame(median = median(haz.B),
                                 ql = quantile(haz.B, qnt.low, names = FALSE),
                                 qu = quantile(haz.B, qnt.high, names = FALSE)), 2)

  incid.base.W <- unname(colSums(sim.base$epi$incid.W))
  incid.base.B <- unname(colSums(sim.base$epi$incid.B))

  disp.ind.rel <- haz.B/haz.W
  disp.ind.rel.base <- round(data.frame(median = median(disp.ind.rel),
                                    ql = quantile(disp.ind.rel, qnt.low, names = FALSE),
                                    qu = quantile(disp.ind.rel, qnt.high, names = FALSE)), 2)

  disp.ind.abs <- haz.B - haz.W
  disp.ind.abs.base <- round(data.frame(median = median(disp.ind.abs),
                                        ql = quantile(disp.ind.abs, qnt.low, names = FALSE),
                                        qu = quantile(disp.ind.abs, qnt.high, names = FALSE)), 2)

  # Comparison scenario -------------------------------------------------

  if (!is.null(sim.comp)) {

    sim.comp <- mutate_epi(sim.comp, percPrEP.B = prepCurr.B / num.B)
    sim.comp <- mutate_epi(sim.comp, percPrEP.W = prepCurr.W / num.W)

    percP.W <- as.numeric(colMeans(tail(sim.comp$epi$percPrEP.W, 52)))
    out.percP.W <- round(data.frame(median = median(percP.W),
                                    ql = quantile(percP.W, qnt.low, names = FALSE),
                                    qu = quantile(percP.W, qnt.high, names = FALSE)), 3)

    percP.B <- as.numeric(colMeans(tail(sim.comp$epi$percPrEP.B, 52)))
    out.percP.B <- round(data.frame(median = median(percP.B),
                                  ql = quantile(percP.B, qnt.low, names = FALSE),
                                  qu = quantile(percP.B, qnt.high, names = FALSE)), 3)

    # prevalence
    i.prev.W <- as.numeric(sim.comp$epi$i.prev.W[at, ])
    out.prev.W <- round(data.frame(median = median(i.prev.W),
                                   ql = quantile(i.prev.W, qnt.low, names = FALSE),
                                   qu = quantile(i.prev.W, qnt.high, names = FALSE)), 3)

    i.prev.B <- as.numeric(sim.comp$epi$i.prev.B[at, ])
    out.prev.B <- round(data.frame(median = median(i.prev.B),
                                   ql = quantile(i.prev.B, qnt.low, names = FALSE),
                                   qu = quantile(i.prev.B, qnt.high, names = FALSE)), 3)


    # incidence
    haz.W <- as.numeric(colMeans(tail(sim.comp$epi$ir100.W, 52)))
    out.haz.W <- round(data.frame(median = median(haz.W, na.rm = TRUE),
                                  ql = quantile(haz.W, qnt.low, names = FALSE, na.rm = TRUE),
                                  qu = quantile(haz.W, qnt.high, names = FALSE, na.rm = TRUE)), 2)

    haz.B <- as.numeric(colMeans(tail(sim.comp$epi$ir100.B, 52)))
    out.haz.B <- round(data.frame(median = median(haz.B, na.rm = TRUE),
                                  ql = quantile(haz.B, qnt.low, names = FALSE, na.rm = TRUE),
                                  qu = quantile(haz.B, qnt.high, names = FALSE, na.rm = TRUE)), 2)

    disp.ind.rel <- haz.B/haz.W
    out.disp.ind.rel <- round(data.frame(median = median(disp.ind.rel),
                                     ql = quantile(disp.ind.rel, qnt.low, names = FALSE),
                                     qu = quantile(disp.ind.rel, qnt.high, names = FALSE)), 2)

    disp.ind.abs <- haz.B - haz.W
    out.disp.ind.abs <- round(data.frame(median = median(disp.ind.abs),
                                         ql = quantile(disp.ind.abs, qnt.low, names = FALSE),
                                         qu = quantile(disp.ind.abs, qnt.high, names = FALSE)), 2)

    # HR
    num.W <- unname(colMeans(tail(sim.comp$epi$ir100.W, 52)))
    denom.W <- unname(colMeans(tail(sim.base$epi$ir100.W, 52)))
    vec.hr.W <- num.W/denom.W
    out.hr.W <- round(data.frame(median = median(vec.hr.W, na.rm = TRUE),
                                 ql = quantile(vec.hr.W, qnt.low, names = FALSE, na.rm = TRUE),
                                 qu = quantile(vec.hr.W, qnt.high, names = FALSE, na.rm = TRUE)), 2)

    num.B <- unname(colMeans(tail(sim.comp$epi$ir100.B, 52)))
    denom.B <- unname(colMeans(tail(sim.base$epi$ir100.B, 52)))
    vec.hr.B <- num.B/denom.B
    out.hr.B <- round(data.frame(median = median(vec.hr.B, na.rm = TRUE),
                                 ql = quantile(vec.hr.B, qnt.low, names = FALSE, na.rm = TRUE),
                                 qu = quantile(vec.hr.B, qnt.high, names = FALSE, na.rm = TRUE)), 2)

    prev.ind <- vec.hr.B/vec.hr.W
    out.prev.ind <- round(data.frame(median = median(prev.ind, na.rm = TRUE),
                                     ql = quantile(prev.ind, qnt.low, names = FALSE, na.rm = TRUE),
                                     qu = quantile(prev.ind, qnt.high, names = FALSE, na.rm = TRUE)), 2)

    # NIA
    incid.comp.W <- unname(colSums(sim.comp$epi$incid.W))
    vec.nia.W <- incid.base.W - incid.comp.W

    incid.comp.B <- unname(colSums(sim.comp$epi$incid.B))
    vec.nia.B <- incid.base.B - incid.comp.B

    # PIA
    vec.pia.W <- vec.nia.W/incid.base.W
    out.pia.W <- round(data.frame(median = median(vec.pia.W),
                                ql = quantile(vec.pia.W, qnt.low, names = FALSE),
                                qu = quantile(vec.pia.W, qnt.high, names = FALSE)), 3)

    vec.pia.B <- vec.nia.B/incid.base.B
    out.pia.B <- round(data.frame(median = median(vec.pia.B),
                                  ql = quantile(vec.pia.B, qnt.low, names = FALSE),
                                  qu = quantile(vec.pia.B, qnt.high, names = FALSE)), 3)


    # NNT
    py.on.prep.W <- unname(colSums(sim.comp$epi$prepCurr.W))/52
    vec.nnt.W <- py.on.prep.W/(median(incid.base.W) - unname(colSums(sim.comp$epi$incid.W)))
    out.nnt.W <- round(data.frame(median = median(vec.nnt.W),
                                  ql = quantile(vec.nnt.W, qnt.low, names = FALSE),
                                  qu = quantile(vec.nnt.W, qnt.high, names = FALSE)), 1)

    py.on.prep.B <- unname(colSums(sim.comp$epi$prepCurr.B))/52
    vec.nnt.B <- py.on.prep.B/(median(incid.base.B) - unname(colSums(sim.comp$epi$incid.B)))
    out.nnt.B <- round(data.frame(median = median(vec.nnt.B),
                                  ql = quantile(vec.nnt.B, qnt.low, names = FALSE),
                                  qu = quantile(vec.nnt.B, qnt.high, names = FALSE)), 1)


    cat("\nPercent on PrEP W:")
    print(t(out.percP.W))

    cat("\nPercent on PrEP B:")
    print(t(out.percP.B))

    cat("\nHIV Prevalence W:")
    print(t(out.prev.W))

    cat("\nHIV Prevalence B:")
    print(t(out.prev.B))

    cat("\nHIV Incidence W:")
    print(t(out.haz.W))

    cat("\nHIV Incidence B:")
    print(t(out.haz.B))

    cat("\nDisparity Index Abs:")
    print(t(out.disp.ind.abs))

    cat("\nDisparity Index Abs:")
    print(t(out.disp.ind.abs))

    cat("\nDisparity Index Rel:")
    print(t(out.disp.ind.rel))

    cat("\nHIV Hazard Ratio W:")
    print(t(out.hr.W))

    cat("\nHIV Hazard Ratio B:")
    print(t(out.hr.B))

    cat("\nPrevention Index:")
    print(t(out.prev.ind))

    cat("\nHIV PIA W:")
    print(t(out.pia.W))

    cat("\nHIV PIA B:")
    print(t(out.pia.B))

    cat("\nHIV NNT W:")
    print(t(out.nnt.W))

    cat("\nHIV NNT B:")
    print(t(out.nnt.B))

  } else {

    cat("\nHIV Prevalence W:")
    print(t(prev.base.W))

    cat("\nHIV Prevalence B:")
    print(t(prev.base.B))

    cat("\nHIV Incidence W:")
    print(t(haz.base.W))

    cat("\nHIV Incidence B:")
    print(t(haz.base.B))

    cat("\nDisparity Index Abs:")
    print(t(disp.ind.abs.base))

    cat("\nDisparity Index Rel:")
    print(t(disp.ind.rel.base))

  }

}
