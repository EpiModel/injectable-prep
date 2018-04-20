#!/bin/bash

### User specs
#PBS -N lap
#PBS -l nodes=1:ppn=16,mem=50gb,feature=16core,walltime=01:00:00
#PBS -o /suppscr/csde/sjenness/lap/out
#PBS -e /suppscr/csde/sjenness/lap/out
#PBS -j oe
#PBS -d /suppscr/csde/sjenness/lap
#PBS -m n

### Standard specs
HYAK_NPE=$(wc -l < $PBS_NODEFILE)
HYAK_NNODES=$(uniq $PBS_NODEFILE | wc -l )
HYAK_TPN=$((HYAK_NPE/HYAK_NNODES))
NODEMEM=`grep MemTotal /proc/meminfo | awk '{print $2}'`
NODEFREE=$((NODEMEM-2097152))
MEMPERTASK=$((NODEFREE/HYAK_TPN))
ulimit -v $MEMPERTASK
export MX_RCACHE=0


### App
Rscript sim.fu.R
