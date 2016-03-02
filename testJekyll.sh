#!/bin/bash
set -euo pipefail

if [ -z $1 ]; then
	echo "./convert.sh foo.md"
	exit 1;
fi
echo "Starting $1"
fullfile=$1

root=$(git rev-parse --show-toplevel)


filename=$(basename "$fullfile")
extension="${filename##*.}"
filename="${filename%.*}"

echo Pandoc $filename
pandoc --smart --normalize -f markdown -t --filter pandoc-citeproc -o $filename.md $1 2> pandoc.log

subl pandoc.log
evince $filename.md &