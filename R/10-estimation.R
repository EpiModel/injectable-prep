# In this file we build the networks (main, casual and oneoff)
# using the ARTnetData package

library(EpiModelHIV)
library(ARTnet)

comp_method <- FALSE

# Create the "out/est/" folder if it does not exists
if (! file.exists("out/est"))
  dir.create("out/est", recursive = T)

# Epistats build or load
if (! file.exists("out/est/epistats.rds")) {
  epistats <- build_epistats(
    geog.lvl = "city",              # default is NULL
    geog.cat = "Atlanta",           # default is NULL
    race = TRUE,                    # default is TRUE
    age.limits = c(15, 65),         # default is c(15, 65)
    age.breaks = c(25, 35, 45, 55), # default is c(25, 35, 45, 55)
    ## init.hiv.prev = c()          # default is NULL, use data from artnet
    browser = FALSE                 # default is FALSE
  )

  saveRDS(epistats, "out/est/epistats.rds", compress = comp_method)
} else {
  epistats <- readRDS("out/est/epistats.rds")
}

# Netparams build
netparams <- build_netparams(
  epistats,
  smooth.main.dur = TRUE # default is FALSE
)

# Netstats build or load
if (! file.exists("out/est/netstats.rds")) {
  netstats <- build_netstats(
    epistats,
    netparams,
    expect.mort = 0.000478213, # default is 0.000478213
    network.size = 10000,      # default is 10000
    browser = FALSE,           # default is FALSE
    edges.avg = FALSE          # default is FALSE
  )

  saveRDS(netstats, "out/est/netstats.rds", compress = comp_method)
} else {
  netstats <- readRDS("out/est/netstats.rds")
}

# 0. Initialize Network ---------------------------------------------------

# Network size
num <- netstats$demog$num

# Initialize and set vertex attributes using `netstats`
nw <- network::network.initialize(num, directed = FALSE)
nw <- network::set.vertex.attribute(
  nw,
  names(netstats$attr),
  netstats$attr
)
# The 3 networks (main, casual and one-off/inst) share an initial structure
nw_main <- nw_casl <- nw_inst <- nw


# 1. Main Model -----------------------------------------------------------

# Formula
model_main <- ~ edges +
  nodematch("age.grp", diff = TRUE) +
  nodefactor("age.grp", levels = -1) +
  nodematch("race", diff = FALSE) +
  nodefactor("race", levels = -1) +
  nodefactor("deg.casl", levels = -1) +
  concurrent +
  degrange(from = 3) +
  nodematch("role.class", diff = TRUE, levels = 1:2)

# Target Stats
netstats_main <- c(
  edges = netstats$main$edges,
  nodematch_age.grp = netstats$main$nodematch_age.grp,
  nodefactor_age.grp = netstats$main$nodefactor_age.grp[-1],
  nodematch_race = netstats$main$nodematch_race_diffF,
  nodefactor_race = netstats$main$nodefactor_race[-1],
  nodefactor_deg.casl = netstats$main$nodefactor_deg.casl[-1],
  concurrent = netstats$main$concurrent,
  degrange = 0,
  nodematch_role.class = c(0, 0)
)

# Fit model
fit_main <- netest(
  nw_main,
  formation = model_main,
  target.stats = unname(netstats_main), # must be an unnamed numeric
  coef.diss = netstats$main$diss.byage,
  set.control.ergm = control.ergm(
    MCMLE.maxit = 500,
    SAN.maxit = 3,
    SAN.nsteps.times = 3
  ),
  edapprox = TRUE, # otherwise will fit using stergm() instead of ergm()
  verbose = FALSE
)


# 2. Casual Model ---------------------------------------------------------

# Formula
model_casl <- ~edges +
  nodematch("age.grp", diff = TRUE) +
  nodefactor("age.grp", levels = -c(1,5)) + # what does this mean?
  nodematch("race", diff = FALSE) +
  nodefactor("race", levels = -1) +
  nodefactor("deg.main", levels = -3) +  # why using level 3 as base here?
  concurrent +
  degrange(from = 4) +
  nodematch("role.class", diff = TRUE, levels = 1:2)

# Target Stats
netstats_casl <- c(
  edges = netstats$casl$edges,
  nodematch_age.grp = netstats$casl$nodematch_age.grp,
  nodefactor_age.grp = netstats$casl$nodefactor_age.grp[-c(1,5)],
  nodematch_race = netstats$casl$nodematch_race_diffF,
  nodefactor_race = netstats$casl$nodefactor_race[-1],
  nodefactor_deg.main = netstats$casl$nodefactor_deg.main[-3],
  concurrent = netstats$casl$concurrent,
  degrange = 0,
  nodematch_role.class = c(0, 0)
)

# Fit model
fit_casl <- netest(
  nw_casl,
  formation = model_casl,
  target.stats = unname(netstats_casl), # must be an unnamed numeric
  coef.diss = netstats$casl$diss.byage,
  set.control.ergm = control.ergm(
    MCMLE.maxit = 500,
    SAN.maxit = 3,
    SAN.nsteps.times = 3
  ),
  verbose = FALSE
)


# 3. One-Off Model --------------------------------------------------------

# Formula
model_inst <- ~edges +
  nodematch("age.grp", diff = FALSE) +
  nodefactor("age.grp", levels = -1) +
  nodematch("race", diff = FALSE) +
  nodefactor("race", levels = -1) +
  nodefactor("risk.grp", levels = -5) +
  nodefactor("deg.tot", levels = -1) +
  nodematch("role.class", diff = TRUE, levels = 1:2)

# Target Stats
netstats_inst <- c(
  edges = netstats$inst$edges,
  nodematch_age.grp = sum(netstats$inst$nodematch_age.grp),
  nodefactor_age.grp = netstats$inst$nodefactor_age.grp[-1],
  nodematch_race = netstats$inst$nodematch_race_diffF,
  nodefactor_race = netstats$inst$nodefactor_race[-1],
  nodefactor_risk.grp = netstats$inst$nodefactor_risk.grp[-5],
  nodefactor_deg.tot = netstats$inst$nodefactor_deg.tot[-1],
  nodematch_role.class = c(0, 0)
)

# Fit model
fit_inst <- netest(
  nw_inst,
  formation = model_inst,
  target.stats = unname(netstats_inst), # must be an unnamed numeric
  coef.diss = dissolution_coefs(~offset(edges), 1),
  set.control.ergm = control.ergm(
    MCMLE.maxit = 500,
    SAN.maxit = 3,
    SAN.nsteps.times = 3
  ),
  verbose = FALSE
)


# 4. Save Data ------------------------------------------------------------

saveRDS(
  list(
    "main" = fit_main,
    "casual" = fit_casl,
    "one_time" = fit_inst
  ),
  "out/est/netest.rds",
  compress = comp_method
)
