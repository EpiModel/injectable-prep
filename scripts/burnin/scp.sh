#!/bin/bash

# Send
scp scripts/burnin/*.[Rs]* mox:/gscratch/csde/sjenness/lap

# Receive
scp mox:/gscratch/csde/sjenness/lap/data/sim.n1000.rda data/
