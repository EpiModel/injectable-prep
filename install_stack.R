# If private github packages are needed create a token by going to
# https://github.com/settings/tokens
# (Settings / Developer settings / Personal access token)
# Select the `repo` scope

# If your token is not stored as an environment variable
## Sys.setenv(GITHUB_PAT = "your_token")
# Do not share your token. It allows read/write access to your repositories

# Packages installation
if (file.exists("renv.lock")) {# Restore from a lockfile if it exists.

  renv::restore(confirm = FALSE) # Do not ask for confirmation

} else { # Otherwise install the packages and make a lockfile

  # CRAN packages
  install.packages(c(
    "remotes",
    "tergmLite",
    "EpiModel"
  ))

  # Github packages
  remotes::install_github(c(
    "StatNet/EpiModelHPC@257bbf3",
    "EpiModel/EpiModelHIV-p@CombPrev-2.0",
    "EpiModel/ARTnetData@v1.2",
    "EpiModel/ARTnet@v2.5.0"
  ))

  # save the lockfile
  renv::snapshot(type = "simple")
}
