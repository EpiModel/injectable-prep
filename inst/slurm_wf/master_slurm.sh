#!/bin/sh

for f in "$(dirname $0)/job_starters/*"
do
    source $f
done
