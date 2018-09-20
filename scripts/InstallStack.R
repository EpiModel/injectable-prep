

# Install EpiModel Stack
install.packages("EpiModel", dependencies = TRUE)

# Install Extra Helper Packages
install.packages("devtools")
install.packages("remotes")

# Latest Dev Versions of Packages
remotes::install_github("statnet/network")
remotes::install_github("statnet/statnet.common")
remotes::install_github("statnet/ergm")
remotes::install_github("statnet/tergm")

remotes::install_github("statnet/EpiModel")
remotes::install_github("statnet/EpiModelHPC")
remotes::install_github("statnet/tergmLite")

remotes::install_github("EpiModel/EpiModelHIV-p", ref = "injectable-prep")
