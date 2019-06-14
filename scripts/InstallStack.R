

# Install EpiModel Stack
install.packages("EpiModel")

# Install Extra Helper Packages
install.packages(c("remotes", "sessioninfo"))

# Latest Dev Versions of Packages
remotes::install_github("statnet/network", ref = "deff2a0")
remotes::install_github("statnet/networkDynamic", ref = "14182bf")
remotes::install_github("statnet/statnet.common", ref = "3307a8c")
remotes::install_github("statnet/ergm", ref = "7c81899")
remotes::install_github("statnet/tergm", ref = "d3af135")

remotes::install_github("statnet/EpiModel", ref = "ea6aa16")
remotes::install_github("statnet/EpiModelHPC", ref = "a53760d")
remotes::install_github("statnet/tergmLite", ref = "73d2a2d")

remotes::install_github("EpiModel/EpiModelHIV-p", ref = "injectable-prep")
remotes::install_github("EpiModel/EpiModelHIV-p", ref = "5bc2af6")



# Package Listing ---------------------------------------------------------

library("EpiModelHIV")
sessioninfo::session_info()

# Runs on Jan 3 2019

# EpiModel       * 1.7.3       2019-01-03 [1] Github (statnet/EpiModel@20ed1fa)
# EpiModelHIV    * 1.5.0       2019-01-03 [1] Github (EpiModel/EpiModelHIV-p@924f511)
# EpiModelHPC    * 2.0.0       2019-01-03 [1] Github (statnet/EpiModelHPC@1d6accc)
# ergm           * 3.10.0-4725 2019-01-03 [1] Github (statnet/ergm@9cad193)
# network        * 1.14-355    2018-12-14 [1] Github (statnet/network@533c8db)
# statnet.common   4.2.0-208   2018-12-18 [1] Github (statnet/statnet.common@095f1ac)
# tergm          * 3.6.0-1659  2018-12-14 [1] Github (statnet/tergm@d3af135)
# tergmLite      * 1.2.0       2018-12-18 [1] Github (statnet/tergmLite@73d2a2d)


# Updates on Mar 27 2019

# EpiModel       * 1.7.3       2019-03-27 [1] Github (statnet/EpiModel@ea6aa16)
# EpiModelHIV    * 1.5.0       2019-03-27 [1] Github (EpiModel/EpiModelHIV-p@5bc2af6)
# EpiModelHPC    * 2.0.1       2019-01-22 [1] Github (statnet/EpiModelHPC@a53760d)
# ergm           * 3.10.0-4827 2019-03-27 [1] Github (statnet/ergm@7c81899)
# network        * 1.14-377    2019-03-22 [1] Github (statnet/network@deff2a0)
# networkDynamic * 0.10        2019-05-03 [1] Github (statnet/networkDynamic@14182bf)
# statnet.common   4.3.0-230   2019-02-20 [1] Github (statnet/statnet.common@3307a8c)
# tergm          * 3.6.0-1659  2019-01-22 [1] Github (statnet/tergm@d3af135)
# tergmLite      * 1.2.0       2019-01-22 [1] Github (statnet/tergmLite@73d2a2d)
