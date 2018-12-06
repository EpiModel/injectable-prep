#!/bin/bash

## Job Name
#SBATCH --job-name=lap-fu

## Nodes
#SBATCH --nodes=1

## Tasks per node
#SBATCH --ntasks-per-node=28

## Walltime
#SBATCH --time=1:00:00

## E-mail notification
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=sjennes@emory.edu

## Memory per node
#SBATCH --mem=100G

## Specify the working directory
#SBATCH --workdir=/gscratch/csde/sjenness/lap

. /gscratch/csde/sjenness/spack/share/spack/setup-env.sh
module load gcc-8.2.0-gcc-4.8.5-rhsxipz
module load r-3.5.1-gcc-8.2.0-4suigve

Rscript sim.fu.mox.R
