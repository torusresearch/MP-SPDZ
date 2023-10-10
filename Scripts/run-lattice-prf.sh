#!/usr/bin/env bash

int_size="${INT_SIZE:-32}"
prog="${PROG:-lattice_prf}"

./compile.py -O -F "$int_size" $prog &&
./Scripts/mal-shamir-offline.sh -lgp 256 $prog &&
./Scripts/mal-shamir.sh -F $prog