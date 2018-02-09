#!/bin/bash

qsub -q batch -t 1-7 -m n -v SIMNO=1000,NJOBS=7,PLNT=TRUE,PIND=1 runsim.burn.sh
qsub -q batch -t 1-7 -m n -v SIMNO=1001,NJOBS=7,PLNT=TRUE,PIND=2 runsim.burn.sh
qsub -q batch -t 1-7 -m n -v SIMNO=1002,NJOBS=7,PLNT=TRUE,PIND=3 runsim.burn.sh
qsub -q batch -t 1-7 -m n -v SIMNO=1003,NJOBS=7,PLNT=TRUE,PIND=4 runsim.burn.sh
qsub -q batch -t 1-7 -m n -v SIMNO=1004,NJOBS=7,PLNT=TRUE,PIND=5 runsim.burn.sh
