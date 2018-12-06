#!/bin/bash

scp scripts/burnin/*.burn.[Rs]* hyak:/suppscr/csde/sjenness/lap

rm *.out
rm data/*.rda

sbatch -p csde -A csde --array=1-6 --export=SIMNO=1000,NJOBS=6 runsim.burn.sh

scp hyak:/suppscr/csde/sjenness/lap/data/sim.*.rda data/
