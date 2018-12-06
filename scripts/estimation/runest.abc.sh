#!/bin/bash

## Job Name
#SBATCH --job-name=lap-estabc

## Nodes
#SBATCH --nodes=1

## Tasks per node
#SBATCH --ntasks-per-node=16

## Walltime
#SBATCH --time=1:00:00

## E-mail notification
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=sjennes@emory.edu

## Memory per node
#SBATCH --mem=55G

## Specify the working directory
#SBATCH --workdir=/suppscr/csde/sjenness/lap

. /suppscr/csde/sjenness/spack/share/spack/setup-env.sh
module load gcc-8.1.0-gcc-4.4.7-eaajvcy
module load r-3.5.1-gcc-8.1.0-unb32sy

Rscript estim.abc.R
