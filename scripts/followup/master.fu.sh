#!/bin/bash

sbatch -p csde -A csde --array=1-4 --export=ALL,SIMNO=1000,NJOBS=4,PSP=0,PPI=0 runsim.fu.mox.sh

sbatch -p csde -A csde --array=1-4 --export=ALL,SIMNO=2000,NJOBS=4,PSP=0.2925,PPI=0 runsim.fu.mox.sh
sbatch -p csde -A csde --array=1-4 --export=ALL,SIMNO=2001,NJOBS=4,PSP=0.2925,PPI=0.25 runsim.fu.mox.sh
sbatch -p csde -A csde --array=1-4 --export=ALL,SIMNO=2002,NJOBS=4,PSP=0.2925,PPI=0.5 runsim.fu.mox.sh
sbatch -p csde -A csde --array=1-4 --export=ALL,SIMNO=2003,NJOBS=4,PSP=0.2925,PPI=0.75 runsim.fu.mox.sh
sbatch -p csde -A csde --array=1-4 --export=ALL,SIMNO=2004,NJOBS=4,PSP=0.2925,PPI=1 runsim.fu.mox.sh

sbatch -p csde -A csde --array=1-4 --export=ALL,SIMNO=2010,NJOBS=4,PSP=0.20,PPI=0 runsim.fu.mox.sh
sbatch -p csde -A csde --array=1-4 --export=ALL,SIMNO=2011,NJOBS=4,PSP=0.20,PPI=0.25 runsim.fu.mox.sh
sbatch -p csde -A csde --array=1-4 --export=ALL,SIMNO=2012,NJOBS=4,PSP=0.20,PPI=0.5 runsim.fu.mox.sh
sbatch -p csde -A csde --array=1-4 --export=ALL,SIMNO=2013,NJOBS=4,PSP=0.20,PPI=0.75 runsim.fu.mox.sh
sbatch -p csde -A csde --array=1-4 --export=ALL,SIMNO=2014,NJOBS=4,PSP=0.20,PPI=1 runsim.fu.mox.sh

sbatch -p csde -A csde --array=1-4 --export=ALL,SIMNO=2020,NJOBS=4,PSP=0.40,PPI=0 runsim.fu.mox.sh
sbatch -p csde -A csde --array=1-4 --export=ALL,SIMNO=2021,NJOBS=4,PSP=0.40,PPI=0.25 runsim.fu.mox.sh
sbatch -p csde -A csde --array=1-4 --export=ALL,SIMNO=2022,NJOBS=4,PSP=0.40,PPI=0.5 runsim.fu.mox.sh
sbatch -p csde -A csde --array=1-4 --export=ALL,SIMNO=2023,NJOBS=4,PSP=0.40,PPI=0.75 runsim.fu.mox.sh
sbatch -p csde -A csde --array=1-4 --export=ALL,SIMNO=2024,NJOBS=4,PSP=0.40,PPI=1 runsim.fu.mox.sh

sbatch -p csde -A csde --array=1-4 --export=ALL,SIMNO=2030,NJOBS=4,PSP=0.50,PPI=0 runsim.fu.mox.sh
sbatch -p csde -A csde --array=1-4 --export=ALL,SIMNO=2031,NJOBS=4,PSP=0.50,PPI=0.25 runsim.fu.mox.sh
sbatch -p csde -A csde --array=1-4 --export=ALL,SIMNO=2032,NJOBS=4,PSP=0.50,PPI=0.5 runsim.fu.mox.sh
sbatch -p csde -A csde --array=1-4 --export=ALL,SIMNO=2033,NJOBS=4,PSP=0.50,PPI=0.75 runsim.fu.mox.sh
sbatch -p csde -A csde --array=1-4 --export=ALL,SIMNO=2034,NJOBS=4,PSP=0.50,PPI=1 runsim.fu.mox.sh
