#' Create a "slurm workflow" folder using a template
#'
#' @param template_dir path to the template directory
#' @param wf_dir path of the folder to be created
#' @param force should a pre-existing folder at this path be removed
#'   if it exists? (default = TRUE)
#'
#' @return the created folder path (invisible)
slurm_wf_tmpl_dir <- function(template_dir, wf_dir, force = FALSE) {
  if (dir.exists(wf_dir)) {
    if (force) {
      message(paste("Folder: ", wf_dir, "exists. Erasing it (force == TRUE)"))
      unlink(wf_dir, recursive = TRUE)
    } else {
      stop(paste(wf_dir, "exists. To erasing it set `force = TRUE`"))
    }
  }

  fs::dir_copy(template_dir, wf_dir)

  invisible(wf_dir)
}

#' Execute a function using the `base::do.call` syntax in a "slurm workflow"
#'
#' @param wf_dir path to the "slurm workflow" directory created by
#'   `slurm_wf_tmpl_dir`
#' @param resources a list of the parameters to pass to the `brew` templates
#' @param what function to execute
#' @param args a list of named parameters to pass to `what`
slurm_wf_do.call <- function(wf_dir, resources, what, args = list()) {
  job_dir <- paste0(wf_dir, "/job_scripts/")
  starter_dir <- paste0(wf_dir, "/job_starters/")
  rds_dir <- paste0(wf_dir, "/job_rds/")

  other_jobs <- list.files(job_dir)
  if (length(other_jobs) == 0) {
    job_num <- "001"
  } else {
    max_num <- max(other_jobs)
    max_num <- as.numeric(strsplit(max_num, "\\.")[[1]][1])
    job_num <- sprintf("%03d", max_num + 1)
  }

  job_name <- paste0(job_dir,job_num, ".sh")
  starter_name <- paste0(starter_dir, job_num, ".sh")
  rds_name <- paste0(rds_dir, job_num, ".rds")

  if (is.null(resources$log_file))
    resources$log_file <- paste0(wf_dir, "/log/%x_%a.out")

  wf_list <- list(what = what, args = args)
  saveRDS(wf_list, file = rds_name, compress = "xz")

  rscript_cmd <- paste0(
    "wf_list <- readRDS(\"", rds_name, "\");",
    "do.call(wf_list$what, args = wf_list$args)")

  brew::brew(paste0(wf_dir, "/job.tmpl"), job_name)
  brew::brew(paste0(wf_dir, "/starter.tmpl"), starter_name)
}

#' Execute a function using the `base::Map` syntax in a "slurm workflow"
#'
#' @param wf_dir path to the "slurm workflow" directory created by
#'   `slurm_wf_tmpl_dir`
#' @param resources a list of the parameters to pass to the `brew` templates
#' @param FUN function to execute
#' @param ... named vector of parameters to iterate upon and pass to `FUN`
#' @param MoreArgs a list of named parameters to pass to `FUN`
slurm_wf_Map <- function(wf_dir, resources, FUN, ..., MoreArgs = NULL) {
  job_dir <- paste0(wf_dir, "/job_scripts/")
  starter_dir <- paste0(wf_dir, "/job_starters/")
  rds_dir <- paste0(wf_dir, "/job_rds/")

  other_jobs <- list.files(job_dir)
  if (length(other_jobs) == 0) {
    job_num <- "001"
  } else {
    max_num <- max(other_jobs)
    max_num <- as.numeric(strsplit(max_num, "\\.")[[1]][1])
    job_num <- sprintf("%03d", max_num + 1)
  }

  if (is.null(resources$log_file))
    resources$log_file <- paste0(wf_dir, "/log/%x_%a.out")

  job_name <- paste0(job_dir,job_num, ".sh")
  starter_name <- paste0(starter_dir, job_num, ".sh")
  rds_name <- paste0(rds_dir, job_num, ".rds")

  dots <- list(...)
  resources$n_array <- length(dots[[1]])

  wf_list <- list(FUN = FUN, dots = dots, MoreArgs = MoreArgs)
  saveRDS(wf_list, file = rds_name, compress = "xz")

  rscript_cmd <- paste0(
    "wf_list <- readRDS(\"", rds_name, "\");",
    "array_id <- as.numeric(Sys.getenv(\"SLURM_ARRAY_TASK_ID\"));",
    "args_ls <- c(lapply(wf_list$dots, `[[`, array_id), wf_list$MoreArgs);",
    "do.call(wf_list$FUN, args = args_ls)")

  brew::brew(paste0(wf_dir, "/job.tmpl"), job_name)
  brew::brew(paste0(wf_dir, "/starter.tmpl"), starter_name)
}
