#!/bin/bash

qsub -q batch -t 1-4 -m n -v SIMNO=2000,NJOBS=4,COVO=0.15,COVL=0 runsim.fu.sh

qsub -q batch -t 1-16 -m n -v SIMNO=2001,NJOBS=16,COVO=0.15,COVL=0.05 runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2002,NJOBS=16,COVO=0.15,COVL=0.1 runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2003,NJOBS=16,COVO=0.15,COVL=0.15 runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2004,NJOBS=16,COVO=0.15,COVL=0.2 runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2005,NJOBS=16,COVO=0.15,COVL=0.25 runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2006,NJOBS=16,COVO=0.15,COVL=0.3 runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2007,NJOBS=16,COVO=0.15,COVL=0.35 runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2008,NJOBS=16,COVO=0.15,COVL=0.4 runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2009,NJOBS=16,COVO=0.15,COVL=0.45 runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2010,NJOBS=16,COVO=0.15,COVL=0.5 runsim.fu.sh

qsub -q batch -t 1-16 -m n -v SIMNO=2020,NJOBS=16,COVO=0.15,COVL=0.25,REPM=curr.oral runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2021,NJOBS=16,COVO=0.15,COVL=0.5,REPM=curr.oral runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2022,NJOBS=16,COVO=0.15,COVL=0.75,REPM=curr.oral runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2023,NJOBS=16,COVO=0.15,COVL=1,REPM=curr.oral runsim.fu.sh

qsub -q batch -t 1-16 -m n -v SIMNO=2030,NJOBS=16,COVO=0.15,COVL=0.25,REPM=curr.oral.ladhr runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2031,NJOBS=16,COVO=0.15,COVL=0.5,REPM=curr.oral.ladhr runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2032,NJOBS=16,COVO=0.15,COVL=0.75,REPM=curr.oral.ladhr runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2033,NJOBS=16,COVO=0.15,COVL=1,REPM=curr.oral.ladhr runsim.fu.sh

qsub -q batch -t 1-16 -m n -v SIMNO=2040,NJOBS=16,COVO=0.15,COVL=0.15,REPM=all,LADRT=10,HADRP=0 runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2041,NJOBS=16,COVO=0.15,COVL=0.15,REPM=all,LADRT=14,HADRP=0 runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2042,NJOBS=16,COVO=0.15,COVL=0.15,REPM=all,LADRT=16,HADRP=0 runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2043,NJOBS=16,COVO=0.15,COVL=0.15,REPM=all,LADRT=10,HADRP=0.25 runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2044,NJOBS=16,COVO=0.15,COVL=0.15,REPM=all,LADRT=14,HADRP=0.25 runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2045,NJOBS=16,COVO=0.15,COVL=0.15,REPM=all,LADRT=16,HADRP=0.25 runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2046,NJOBS=16,COVO=0.15,COVL=0.15,REPM=all,LADRT=10,HADRP=0.5 runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2047,NJOBS=16,COVO=0.15,COVL=0.15,REPM=all,LADRT=14,HADRP=0.5 runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2048,NJOBS=16,COVO=0.15,COVL=0.15,REPM=all,LADRT=16,HADRP=0.5 runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2049,NJOBS=16,COVO=0.15,COVL=0.15,REPM=all,LADRT=10,HADRP=0.75 runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2050,NJOBS=16,COVO=0.15,COVL=0.15,REPM=all,LADRT=14,HADRP=0.75 runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2051,NJOBS=16,COVO=0.15,COVL=0.15,REPM=all,LADRT=16,HADRP=0.75 runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2052,NJOBS=16,COVO=0.15,COVL=0.15,REPM=all,LADRT=10,HADRP=1 runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2053,NJOBS=16,COVO=0.15,COVL=0.15,REPM=all,LADRT=14,HADRP=1 runsim.fu.sh
qsub -q batch -t 1-16 -m n -v SIMNO=2054,NJOBS=16,COVO=0.15,COVL=0.15,REPM=all,LADRT=16,HADRP=1 runsim.fu.sh


qsub -q bf -t 1-32 -m n -v SIMNO=6040,NJOBS=32,PART=1,RECTACQ=1.0,URETHACQ=1.0,GCTRANS=1.0,CTTRANS=1.0,GCCTTRANS=0,ALLSTITRANS=0 runsim.fu.paf.sh
