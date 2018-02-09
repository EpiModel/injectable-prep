
## Update stiPrEP stack

# Version before fastEL tergmLite merged in
system("git pull")
devtools::install_github("statnet/EpiModel")
devtools::install_github("statnet/EpiModelHPC")
devtools::install_github("statnet/tergmLite", subdir = "tergmLite", ref = "preFastEl")

# version last run for paper
devtools::install_github("statnet/EpiModelHIV", ref = "p3LID")

## to do: previous version checked, done
##        install current prep-sti recheck

##        merge master into prep-sti (new tergmLite)
# current working version of PrEP STI branch
devtools::install_github("statnet/EpiModelHIV", ref = "prep-sti")

##        merge master into prep-sti (new tergmLite)
devtools::install_github("statnet/EpiModelHIV", ref = "prep-sti")
devtools::install_github("statnet/tergmLite", subdir = "tergmLite", ref = "master")

##        new codebase
devtools::install_github("statnet/EpiModelHIV", ref = "PrEPsens")


# upload inputs
system("scp est/*.rda hyak:/gscratch/csde/sjenness/psens/est")
system("scp scripts/burnin/*.burn.* hyak:/gscratch/csde/sjenness/psens/")
