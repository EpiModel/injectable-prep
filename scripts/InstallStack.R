

# Install EpiModel Stack
install.packages("EpiModel")

# Install Extra Helper Packages
install.packages(c("remotes", "sessioninfo"))

# Latest Dev Versions of Packages
remotes::install_github(c("statnet/network",
                          "statnet/statnet.common",
                          "statnet/ergm",
                          "statnet/tergm"))

remotes::install_github(c("statnet/EpiModel",
                          "statnet/EpiModelHPC",
                          "statnet/tergmLite",
                          "EpiModel/EpiABC"))

remotes::install_github("EpiModel/EpiModelHIV-p", ref = "injectable-prep")



# Package Listing ---------------------------------------------------------

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
# networkDynamic * 0.9.0       2016-01-15 [1] CRAN (R 3.5.2)
# statnet.common   4.3.0-230   2019-02-20 [1] Github (statnet/statnet.common@3307a8c)
# tergm          * 3.6.0-1659  2019-01-22 [1] Github (statnet/tergm@d3af135)
# tergmLite      * 1.2.0       2019-01-22 [1] Github (statnet/tergmLite@73d2a2d)
