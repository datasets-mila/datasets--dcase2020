#!/bin/bash

# this script is meant to be used with 'datalad run'

rm files_count.stats
for dir in dev/*/* eval/*/*
do
	echo $(find $dir -type f | wc -l; echo $dir) >> files_count.stats
done

du -s dev/*/* eval/*/* > disk_usage.stats
