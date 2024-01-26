#!/bin/bash
# Input of 5000m would allocate 5 gig
echo "Allocating $1"
head -c $1 /dev/zero | tail
