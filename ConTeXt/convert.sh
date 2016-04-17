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
pandoc --template $root/ConTeXt/template.unitTest --smart --normalize -f markdown -t context --filter pandoc-citeproc --filter $root/ConTeXt/contextStyles.py --no-wrap -o $filename.tex $1 2> pandoc.log
echo Postprocess $filename


#ssed -r -i -f $root/ConTeXt/hyphenated.ssed $filename.tex
#ssed -r -i -f $root/ConTeXt/iframe.ssed $filename.tex

echo ConTeXt $filename
context --purgeall --batchmode $filename.tex --path=$2 > contextRunLog.log 
echo Showing
#subl contextRunLog.log
#subl pandoc.log
#evince $filename.pdf &
