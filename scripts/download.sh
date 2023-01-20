#!/bin/bash
source scripts/utils.sh echo -n

# Saner programming env: these switches turn some bugs into errors
set -o errexit -o pipefail

# This script is meant to be used with the command 'datalad run'

files_url=(
	"https://zenodo.org/record/3678171/files/dev_data_fan.zip?download=1 dev_data_fan.zip"
	"https://zenodo.org/record/3678171/files/dev_data_pump.zip?download=1 dev_data_pump.zip"
	"https://zenodo.org/record/3678171/files/dev_data_slider.zip?download=1 dev_data_slider.zip"
	"https://zenodo.org/record/3678171/files/dev_data_ToyCar.zip?download=1 dev_data_ToyCar.zip"
	"https://zenodo.org/record/3678171/files/dev_data_ToyConveyor.zip?download=1 dev_data_ToyConveyor.zip"
	"https://zenodo.org/record/3678171/files/dev_data_valve.zip?download=1 dev_data_valve.zip"
	"https://zenodo.org/record/3727685/files/eval_data_train_fan.zip?download=1 eval_data_train_fan.zip"
	"https://zenodo.org/record/3727685/files/eval_data_train_pump.zip?download=1 eval_data_train_pump.zip"
	"https://zenodo.org/record/3727685/files/eval_data_train_slider.zip?download=1 eval_data_train_slider.zip"
	"https://zenodo.org/record/3727685/files/eval_data_train_ToyCar.zip?download=1 eval_data_train_ToyCar.zip"
	"https://zenodo.org/record/3727685/files/eval_data_train_ToyConveyor.zip?download=1 eval_data_train_ToyConveyor.zip"
	"https://zenodo.org/record/3727685/files/eval_data_train_valve.zip?download=1 eval_data_train_valve.zip")

git-annex addurl --fast -c annex.largefiles=anything --raw --batch --with-files <<EOF
$(for file_url in "${files_url[@]}" ; do echo "${file_url}" ; done)
EOF
# Downloads should complete correctly but in multiprocesses the last git-annex
# step most likely fails on a BGFS with the error "rename: resource busy
# (Device or resource busy)"
! git-annex get --fast -J8
# Remove the last byte from each files to prevent the "download failed:
# ResponseBodyTooShort" error
ls -l $(list) | grep -oE "\.git/[^']*" | \
	cut -d'/' -f7 | xargs -n1 -- find .git/annex/tmp/ -name | \
	while read f
	do
		newfsize=$(($(stat -c '%s' "${f}") - 1))
		truncate -s $newfsize "${f}"
	done
# Retry incomplete downloads
git-annex get --fast --incomplete
git-annex migrate --fast -c annex.largefiles=anything *

[[ -f md5sums ]] && md5sum -c md5sums
[[ -f md5sums ]] || md5sum $(list -- --fast) > md5sums
