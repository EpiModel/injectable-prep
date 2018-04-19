#!/bin/bash

scp scripts/burnin/*.burn.[Rs]* hyak:/suppscr/csde/sjenness/lap

qsub -q batch -t 1-16 -m n -v SIMNO=1024,NJOBS=16 runsim.burn.sh

scp hyak:/suppscr/csde/sjenness/lap/data/sim.n1023.rda data/

scp hyak:/suppscr/csde/sjenness/lap/data/sim.*.rda data/

scp est/lap.burnin.rda hyak:/suppscr/csde/sjenness/lap/est/

