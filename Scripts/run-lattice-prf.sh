#!/usr/bin/env bash

prog="${PROG:-lattice_prf}"
prime="${PRIME:-57896044618658097711785492504343953926634992332820282019728792003956566065153}"

./compile.py -O -P $prime $prog &&
./Scripts/mal-shamir-offline.sh -P $prime $prog &&
./Scripts/mal-shamir.sh -P $prime -F $prog
