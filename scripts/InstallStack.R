
## Update LA PrEP stack


devtools::install_github("statnet/EpiModel")
devtools::install_github("statnet/EpiModelHPC")
devtools::install_github("statnet/tergmLite")

devtools::install_github("statnet/EpiModelHIV", ref = "injectable-prep")


# upload inputs
system("scp est/*.rda hyak:/suppscr/csde/sjenness/lap/est")
system("scp scripts/burnin/*.burn.* hyak:/suppscr/csde/sjenness/lap/")

system("scp est/*.rda libra:~/lap/est")
system("scp scripts/burnin/*.burn.* hyak:~/lap/")
