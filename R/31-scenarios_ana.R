library(data.table)
library(ggplot2)
library(patchwork)
theme_set(theme_light())

dt <- readRDS("out/scenarios/scenarios_out.rds")

# hiv prev / hiv inci (last year) / cum PIA
dt[, scenarios_grp := tstrsplit(param_grp, "-" , keep = 1L, fixed = TRUE)
  ## separating the two is necessary for some reason
  ][, `:=`(
    year = (time - 1) %/% 52,
    prep_prop_overall = s_prep / s,
    prep_prop = s_prep / s_prep_elig,
    prop_dx = i_dx / i,
    prop_tx = i_tx / i,
    prop_tx_dx = i_tx / i_dx,
    prop_sup = i_sup / i,
    prop_sup_dx = i_sup / i_dx,
    prop_sup_tx = i_sup / i_tx
  )]

dt[time == 52 * 69 & param_grp == "0_base",
   lapply(.SD, mean),
   .SDcols = names(dt)[grepl("prep[_a-z0-9]*", names(dt))]]

pct_vals <- c("prep_prop", "prep_any12m", "linked1m_1y",
              "prop_dx", "prop_tx", "prop_tx_dx", "prop_sup", "prop_sup_dx",
              "prop_sup_tx", "cond_prob" )

## Annual values
dt_yearly <- dt[,
  c(
    lapply(.SD, median),
    .(incid = sum(incid), pyar = mean(s),
      pyprep = mean(s_prep), pyart = mean(i_tx))
  ),
  by = c("scenarios_grp", "param_grp", "sim_id", "year"),
  .SDcols = c(pct_vals, "med_test_int")
  ][, i_pyar := incid * 100 / pyar][]

## Annual median + SI95
dt_y_sum <- dt_yearly[,
  c(.(i_pyar = pretty_out(i_pyar, T, 0.01),
      med_test_int = pretty_out(med_test_int / 4, T, 1)),
    lapply(.SD, pretty_out)),
  by = c("scenarios_grp", "param_grp", "year"),
  .SDcols = pct_vals]

## PIA & NNT - warning, NNT on prep. So no sens for other scenarios
dt_outcomes <- dt_yearly[,
  .(incid = sum(incid), pyprep = sum(pyprep), pyart = sum(pyart)),
  by = c("scenarios_grp", "param_grp", "sim_id")
  ][, `:=`(
    nia = .SD[param_grp == "0_base", median(incid)] - incid,
    base_pyprep = .SD[param_grp == "0_base", median(pyprep)],
    base_pyart = .SD[param_grp == "0_base", median(pyart)]
  )][, `:=`(pia = nia / (nia + incid),
            nnt_prep = (pyprep - base_pyprep) / nia,
            nnt_art = (pyart - base_pyart) / nia,
            hr = incid / (nia + incid))]

dt_out_clean <- dt_outcomes[,
  .(pia = pretty_out(pia),
  ##   nnt_art = pretty_out(nnt_art, T),
  ##   nnt_prep = pretty_out(nnt_prep, T),
    hr = pretty_out(hr, T, 0.01)
  ),
  by = "param_grp"]
