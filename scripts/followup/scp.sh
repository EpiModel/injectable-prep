#!/bin/bash

# hyak
# scp est/*.rda hyak:/gscratch/csde/sjenness/lap/est
scp scripts/followup/*.[Rs]* hyak:/gscratch/csde/sjenness/lap

scp hyak:/gscratch/csde/sjenness/lap/data/sim.n*.rda data/


# mox
# scp est/*.rda mox:/gscratch/csde/sjenness/lap/est
scp scripts/followup/*.[Rs]* mox:/gscratch/csde/sjenness/lap

scp mox:/gscratch/csde/sjenness/lap/data/*.rda data/
scp mox:/gscratch/csde/sjenness/lap/data/PaperDatav2_T3.zip data/
scp mox:/gscratch/csde/sjenness/lap/data/PaperDatav2_F3.zip data/
