
## Update LA PrEP stack

. /suppscr/csde/sjenness/spack/share/spack/setup-env.sh
module load r-3.5.0-gcc-8.1.0-bcqjjkd
module load gcc-8.1.0-gcc-4.4.7-eaajvcy
module load curl-7.60.0-gcc-8.1.0-nslvpk6

# Necessary now every time using devtools on Hyak
install.packages("curl")

devtools::install_github("statnet/EpiModel")
devtools::install_github("statnet/EpiModelHPC")
devtools::install_github("statnet/tergmLite")

devtools::install_github("statnet/EpiModelHIV", ref = "injectable-prep")
devtools::install_github("statnet/EpiModelHIV", ref = "syph_ept")

# upload inputs
system("scp est/*.rda hyak:/suppscr/csde/sjenness/lap/est")
system("scp scripts/burnin/*.burn.* hyak:/suppscr/csde/sjenness/lap/")

system("scp est/*.rda libra:~/lap/est")
system("scp scripts/burnin/*.burn.* hyak:~/lap/")
