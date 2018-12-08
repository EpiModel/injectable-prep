#!/bin/bash

# hyak
scp est/*.rda hyak:/gscratch/csde/sjenness/lap/est
scp scripts/followup/*.[Rs]* hyak:/gscratch/csde/sjenness/lap

scp hyak:/gscratch/csde/sjenness/lap/data/sim.n*.rda data/


# mox
scp est/*.rda mox:/gscratch/csde/sjenness/lap/est
scp scripts/followup/*.mox.[Rs]* mox:/gscratch/csde/sjenness/lap


scp mox:/gscratch/csde/sjenness/lap/data/sim.n*.rda data/
