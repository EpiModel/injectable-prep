library(EpiModelHIV)
library(readxl)
df_scenarios <- read_excel("out/est/params3.xlsx")

for (sce in df_scenarios$SIMNO) {
  if (sce <= 4033 | sce == 4067) next
  print(sce)
  sim <- readRDS(paste0("out/scenarios/out_comb/sim_", sce, ".rds"))
  rm(sim)
  gc()
}


df_scenarios <- read_excel("out/est/params_new.xlsx")
sims_path <- "out/scenarios/out"


for (scen_no in df_scenarios$SIMNO) {
  sim_files <- paste0(sims_path, "/", scen_no, "/sim", rep(1:3), ".rds")

  sims <- lapply(sim_files, function(x) truncate_sim(readRDS(x), 3380))

  for (i in seq_along(sims)) {
    sim <- sims[[i]]

    sim$network <- NULL
    sim$attr <- NULL
    sim$temp <- NULL
    sim$el <- NULL
    sim$p <- NULL

    if (i == 1) {
      out <- sim
    } else {
      out <- merge(out, sim, param.error = FALSE)
    }
  }

  saveRDS(out, paste0(sims_path, "/", scen_no, ".rds"), compress = "xz")
}
