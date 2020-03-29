dist_squ <- function(x, y) {
  sum((x - y)^2)
}

dist_abs <- function(x, y) {
  sum(abs(x - y))
}

dist_cos <- function(x, y) {
  sum(x * y) / sqrt(sum(x^2)) * sqrt(sum(y^2))
}

dist_log <- function(x, y) {
  sum(abs(log10(x) - log10(y)))
}

dist_caliper <- function(x, y) {
  dif <- abs(x - y)

  threshold <- 0.01
  sum(dif > unlist(threshold))
}

dist_tresh <- function(x, y) {
  dif <- abs(x - y)

  sum(dplyr::case_when(
    dif < 0.005 ~ 0,
    dif < 0.01 ~ 1,
    dif < 0.015 ~ 2,
    dif < 0.02 ~ 5,
    TRUE ~ Inf))
}


## process_sim <- function(file, n_steps) {
##   file_id <- path_rel(file, path)

##   readRDS(file) %>%
##     as.data.frame() %>%
##     group_by(sim) %>%
##     slice((n() - n_steps + 1):n()) %>%
##     ungroup() %>%
##     mutate(sim_id = paste0(file_id, "--", sim))
## }

process_sim <- function(file, n_steps, sims_path) {
  file_id <- path_rel(file, sims_path)
  file_grp <- path_dir(file_id)

  dt <- as.data.table(readRDS(file))
  dt[, .SD[(.N - n_steps + 1):.N] , by = "sim"
     ][, c("sim_id", "param_grp") := .(paste0(..file_id, "--", sim), file_grp)][]
}

create_big_sim_df <- function(sims_path, n_steps = 52) {

  dirs <- dir_ls(sims_path, type = "directory")

  ls_dirs <- future_lapply(dirs, function(dir) {
    files <- dir_ls(dir, regexp = "[.]rds$")

    rbindlist(future_lapply(files, process_sim,
                            n_steps = n_steps, sims_path = sims_path))
  })

  rbindlist(ls_dirs, fill = TRUE)
}
