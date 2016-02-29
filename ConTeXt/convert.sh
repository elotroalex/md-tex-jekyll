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

# pandoc --smart --normalize -f markdown -t native --filter ./contextBibliography.py -o $filename.nat $1
echo Pandoc $filename
pandoc --template $root/ConTeXt/template.unitTest --smart --normalize -f markdown -t context --filter pandoc-citeproc --filter $root/ConTeXt/contextStyles.py -o $filename.tex $1 2> pandoc.log
echo ConTeXt $filename

context --purgeall --batchmode $filename.tex --path=$2 > contextRunLog.log 

subl contextRunLog.log
subl pandoc.log
evince $filename.pdf &