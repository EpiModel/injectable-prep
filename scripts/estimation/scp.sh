#!/bin/bash

scp scripts/estimation/*.abc.[Rs]* hyak:/suppscr/csde/sjenness/lap
scp est/*.rda hyak:/suppscr/csde/sjenness/lap/est

sbatch -p csde -A csde --array=1-100 runest.abc.sh

scp hyak:/suppscr/csde/sjenness/lap/data/sim.*.rda scripts/estimation/data/
