#!/bin/bash

###########################################
# Author: Pratyush
# Date: 21/08/2023
#
# This script outputs the node health
#
# Version: v1
###########################################

set -x # Debug-mode
set -e # Exit the script when fail at any line

df -h

free -g

nproc

