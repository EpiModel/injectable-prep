#!/bin/bash

# hyak
scp est/*.rda hyak:/gscratch/csde/sjenness/lap/est
scp scripts/followup/*.fu.[Rs]* hyak:/gscratch/csde/sjenness/lap

sbatch -p ckpt -A csde-ckpt --array=1-7 --export=ALL,SIMNO=1000,NJOBS=7,PSP=0,PPI=0 runsim.fu.sh

sbatch -p csde -A csde --array=4 --export=ALL,SIMNO=2000,NJOBS=7,PSP=0.2925,PPI=0 runsim.fu.sh
sbatch -p ckpt -A csde-ckpt --array=1-7 --export=ALL,SIMNO=2000,NJOBS=7,PSP=0.2925,PPI=0 runsim.fu.sh
sbatch -p ckpt -A csde-ckpt --array=1-7 --export=ALL,SIMNO=2002,NJOBS=7,PSP=0.2925,PPI=0.5 runsim.fu.sh

scp hyak:/gscratch/csde/sjenness/lap/data/sim.n*.rda data/


# mox
scp est/*.rda mox:/gscratch/csde/sjenness/lap/est
scp scripts/followup/*.mox.[Rs]* mox:/gscratch/csde/sjenness/lap

sbatch -p csde -A csde --array=1-4 --export=ALL,SIMNO=1000,NJOBS=4,PSP=0,PPI=0 runsim.fu.mox.sh
sbatch -p csde -A csde --array=1-4 --export=ALL,SIMNO=2000,NJOBS=4,PSP=0.2925,PPI=0 runsim.fu.mox.sh
sbatch -p csde -A csde --array=1-4 --export=ALL,SIMNO=2002,NJOBS=4,PSP=0.2925,PPI=0.5 runsim.fu.mox.sh


scp mox:/gscratch/csde/sjenness/lap/data/sim.n*.rda data/
