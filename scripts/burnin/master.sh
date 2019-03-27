#!/bin/bash

sbatch -p csde -A csde --array=1-4 --nodes=1 --ntasks-per-node=28 --time=1:00:00 --mem=100G --job-name=s1000 --export=ALL,SIMNO=1000,NJOBS=4,NSIMS=112 runsim.sh
