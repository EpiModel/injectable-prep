#!/bin/bash

sbatch -p ckpt -A csde-ckpt --array=1-7 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2000 --export=ALL,SIMNO=2000,NJOBS=7,NSIMS=100,PSP=0.2925,PPI=0 runsim.sh
sbatch -p ckpt -A csde-ckpt --array=1-7 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2001 --export=ALL,SIMNO=2001,NJOBS=7,NSIMS=100,PSP=0.1,PPI=0 runsim.sh
sbatch -p ckpt -A csde-ckpt --array=1-7 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2002 --export=ALL,SIMNO=2002,NJOBS=7,NSIMS=100,PSP=0.2,PPI=0 runsim.sh
sbatch -p ckpt -A csde-ckpt --array=1-7 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2003 --export=ALL,SIMNO=2003,NJOBS=7,NSIMS=100,PSP=0.4,PPI=0 runsim.sh
sbatch -p ckpt -A csde-ckpt --array=1-7 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2004 --export=ALL,SIMNO=2004,NJOBS=7,NSIMS=100,PSP=0.5,PPI=0 runsim.sh
sbatch -p ckpt -A csde-ckpt --array=1-7 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2005 --export=ALL,SIMNO=2005,NJOBS=7,NSIMS=100,PSP=0.2925,PPI=0.25 runsim.sh
sbatch -p ckpt -A csde-ckpt --array=1-7 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2006 --export=ALL,SIMNO=2006,NJOBS=7,NSIMS=100,PSP=0.1,PPI=0.25 runsim.sh
sbatch -p ckpt -A csde-ckpt --array=1-7 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2007 --export=ALL,SIMNO=2007,NJOBS=7,NSIMS=100,PSP=0.2,PPI=0.25 runsim.sh
sbatch -p ckpt -A csde-ckpt --array=1-7 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2008 --export=ALL,SIMNO=2008,NJOBS=7,NSIMS=100,PSP=0.4,PPI=0.25 runsim.sh
sbatch -p ckpt -A csde-ckpt --array=1-7 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2009 --export=ALL,SIMNO=2009,NJOBS=7,NSIMS=100,PSP=0.5,PPI=0.25 runsim.sh
sbatch -p ckpt -A csde-ckpt --array=1-7 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2010 --export=ALL,SIMNO=2010,NJOBS=7,NSIMS=100,PSP=0.2925,PPI=0.5 runsim.sh
sbatch -p ckpt -A csde-ckpt --array=1-7 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2011 --export=ALL,SIMNO=2011,NJOBS=7,NSIMS=100,PSP=0.1,PPI=0.5 runsim.sh
sbatch -p ckpt -A csde-ckpt --array=1-7 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2012 --export=ALL,SIMNO=2012,NJOBS=7,NSIMS=100,PSP=0.2,PPI=0.5 runsim.sh
sbatch -p ckpt -A csde-ckpt --array=1-7 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2013 --export=ALL,SIMNO=2013,NJOBS=7,NSIMS=100,PSP=0.4,PPI=0.5 runsim.sh
sbatch -p ckpt -A csde-ckpt --array=1-7 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2014 --export=ALL,SIMNO=2014,NJOBS=7,NSIMS=100,PSP=0.5,PPI=0.5 runsim.sh
sbatch -p ckpt -A csde-ckpt --array=1-7 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2015 --export=ALL,SIMNO=2015,NJOBS=7,NSIMS=100,PSP=0.2925,PPI=0.75 runsim.sh
sbatch -p ckpt -A csde-ckpt --array=1-7 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2016 --export=ALL,SIMNO=2016,NJOBS=7,NSIMS=100,PSP=0.1,PPI=0.75 runsim.sh
sbatch -p ckpt -A csde-ckpt --array=1-7 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2017 --export=ALL,SIMNO=2017,NJOBS=7,NSIMS=100,PSP=0.2,PPI=0.75 runsim.sh
sbatch -p ckpt -A csde-ckpt --array=1-7 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2018 --export=ALL,SIMNO=2018,NJOBS=7,NSIMS=100,PSP=0.4,PPI=0.75 runsim.sh
sbatch -p ckpt -A csde-ckpt --array=1-7 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2019 --export=ALL,SIMNO=2019,NJOBS=7,NSIMS=100,PSP=0.5,PPI=0.75 runsim.sh
sbatch -p ckpt -A csde-ckpt --array=1-7 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2020 --export=ALL,SIMNO=2020,NJOBS=7,NSIMS=100,PSP=0.2925,PPI=1 runsim.sh
sbatch -p ckpt -A csde-ckpt --array=1-7 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2021 --export=ALL,SIMNO=2021,NJOBS=7,NSIMS=100,PSP=0.1,PPI=1 runsim.sh
sbatch -p ckpt -A csde-ckpt --array=1-7 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2022 --export=ALL,SIMNO=2022,NJOBS=7,NSIMS=100,PSP=0.2,PPI=1 runsim.sh
sbatch -p ckpt -A csde-ckpt --array=1-7 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2023 --export=ALL,SIMNO=2023,NJOBS=7,NSIMS=100,PSP=0.4,PPI=1 runsim.sh
sbatch -p ckpt -A csde-ckpt --array=1-7 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2024 --export=ALL,SIMNO=2024,NJOBS=7,NSIMS=100,PSP=0.5,PPI=1 runsim.sh

sbatch -p csde -A csde --array=4 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2000 --export=ALL,SIMNO=2000,NJOBS=7,NSIMS=100,PSP=0.2925,PPI=0 runsim.sh
sbatch -p csde -A csde --array=1,3,6 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2001 --export=ALL,SIMNO=2001,NJOBS=7,NSIMS=100,PSP=0.1,PPI=0 runsim.sh
sbatch -p csde -A csde --array=1 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2010 --export=ALL,SIMNO=2010,NJOBS=7,NSIMS=100,PSP=0.2925,PPI=0.5 runsim.sh
sbatch -p csde -A csde --array=1 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2020 --export=ALL,SIMNO=2020,NJOBS=7,NSIMS=100,PSP=0.2925,PPI=1 runsim.sh
sbatch -p csde -A csde --array=4 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2021 --export=ALL,SIMNO=2021,NJOBS=7,NSIMS=100,PSP=0.1,PPI=1 runsim.sh
sbatch -p csde -A csde --array=4-7 --nodes=1 --ntasks-per-node=16 --time=1:00:00 --mem=55G --job-name=s2022 --export=ALL,SIMNO=2022,NJOBS=7,NSIMS=100,PSP=0.2,PPI=1 runsim.sh
