#!/bin/bash

qsub -q batch -m ae -v NSIM=100,PACC=0.01 runsim.burn.abcsmc.sh
qsub -q batch -m ae -v NSIM=100,PACC=0.05 runsim.burn.abcsmc.sh
qsub -q batch -m ae -v NSIM=100,PACC=0.10 runsim.burn.abcsmc.sh


qsub -q batch -m ae -v NSIM=100,PACC=0.01 runsim.burn.abcsmc2.sh
qsub -q batch -m ae -v NSIM=100,PACC=0.05 runsim.burn.abcsmc2.sh
qsub -q batch -m ae -v NSIM=100,PACC=0.10 runsim.burn.abcsmc2.sh


qsub -q batch -m ae -v NSIM=100,PACC=0.01 runsim.burn.abcsmc3.sh
qsub -q batch -m ae -v NSIM=100,PACC=0.05 runsim.burn.abcsmc3.sh
qsub -q batch -m ae -v NSIM=100,PACC=0.10 runsim.burn.abcsmc3.sh

qsub -q batch -m ae -v NSIM=100,PACC=0.01 runsim.burn.abcsmc4.sh
qsub -q batch -m ae -v NSIM=100,PACC=0.05 runsim.burn.abcsmc4.sh
qsub -q batch -m ae -v NSIM=100,PACC=0.10 runsim.burn.abcsmc4.sh
