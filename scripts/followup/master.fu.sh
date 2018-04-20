#!/bin/bash

qsub -q batch -t 1-16 -m n -v SIMNO=2000,NJOBS=16,COVO=0.15,COVL=0 runsim.fu.sh

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
