#!/bin/bash
source scripts/utils.sh echo -n

# Saner programming env: these switches turn some bugs into errors
set -o errexit -o pipefail

# This script is meant to be used with the command 'datalad run'

python3 -m pip install -r scripts/requirements_extract.txt

_SNAME=$(basename "$0")

mkdir -p logs/

dev_archives=($(ls dev_*.zip))
eval_archives=($(ls eval_*.zip))

for archive in "${dev_archives[@]}"
do
	jug status -- scripts/extract.py $archive --output "dev/"
	jug execute -- scripts/extract.py $archive --output "dev/" \
		1>>logs/${_SNAME}_dev.out_$$ 2>>logs/${_SNAME}_dev.err_$$
done

for archive in "${eval_archives[@]}"
do
	jug status -- scripts/extract.py $archive --output "eval/"
	jug execute -- scripts/extract.py $archive --output "eval/" \
		1>>logs/${_SNAME}_eval.out_$$ 2>>logs/${_SNAME}_eval.err_$$
done

for d in "dev/"*/* "eval/"*/*
do
        printf "%s\n" "${d}"
done | sort -u | ./scripts/stats.sh
