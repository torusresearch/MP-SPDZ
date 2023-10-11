#!/usr/bin/env bash

prog="${PROG:-lattice_prf}"

./compile.py -O $prog &&
./Scripts/mal-shamir-offline.sh -lgp 256 $prog &&
./Scripts/mal-shamir.sh -F $prog