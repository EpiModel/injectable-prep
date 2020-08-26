
#'  Simple quantile function ignoring NA and always returning a value from `x`
#'
#' The qth quantile of a list (0 < q ≤ 1) is the smallest number such that the
#' fraction q or more of the elements of the list are less than or equal to it.
#' I.e., if the list contains n numbers, the qth quantile, is the smallest
#' number Q such that at least n×q elements of the list are less than or equal
#' to Q.
#'
#' @param x a numerical vector
#' @param q a vector of the quantiles of x to return
#'
#' @return a named vector of quantiles
simple_quantile <- function(x, q) {
  round(quantile(x, probs = q, type = 1, na.rm = T), 3)
}

#' Summarize a target over the last `nsteps`
#'
#' @param df a data.frame obtain with `as.data.frame(sim)`
#' @param cols the names of the columns containing the simulated values
#' @param funs a named list of function to summarize each column
#' @param targets a vector of desired values, default = 0 to see the simulated
#'        values, otherwise we see the difference between simulated and target
#' @param nsteps the number of steps to look over
#' @param grp additional grouping column
target_sum <- function(df, cols, funs, targets = 0, nsteps = 52, grp = NULL) {
  dt <- if (!data.table::is.data.table(df)) data.table::as.data.table(df) else df
  if (!is.list(targets)) targets <- as.list(targets)

  grp_size <- if (!is.null(grp)) length(unique(dt[[grp]])) else 1
  long_target <- unlist(lapply(targets, rep, times = grp_size))

  t_sum <- function(x) lapply(funs, function(f) f(x))

  dt <- dt[time > max(time) - nsteps, c(..grp, "time", ..cols)
           ][, c(cols) := .SD - ..targets, .SDcols = cols]

  dt <- data.table::melt(dt, id.vars = c(grp, "time"), measure.vars = cols)

  dt <- dt[, unlist(lapply(.SD, t_sum), recursive = FALSE),
           by = c(grp, "variable"), .SDcols = "value"
           ][, "target" := long_target][]

  meta <- c(grp, "variable", "target")
  data.table::setcolorder(dt, c(meta, setdiff(names(dt), meta)))

  data.table::setnames(dt, sub("value.", "", names(dt)))
  dt
}
