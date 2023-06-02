#!/usr/bin/env bash

bit_length="${BIT_LENGTH:-256}"

./compile.py -F "$bit_length" lattice_prf &&
./Scripts/mal-shamir-offline.sh -lgp 256 lattice_prf &&
./Scripts/mal-shamir.sh -F lattice_prf