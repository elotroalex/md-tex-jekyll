#!/bin/bash
set -euo pipefail

if [ -z $1 ]; then
	echo "./convert.sh foo.md"
	exit 1;
fi
echo "Starting $1"
fullfile=$1

root=$2


filename=$(basename "$fullfile")
extension="${filename##*.}"
filename="${filename%.*}"

echo Pandoc $filename
pandoc --template /$root/ConTeXt/template.unitTest --smart --normalize -f markdown -t context --filter /$root/ConTeXt/contextStyles.py --wrap=none -o $filename.tex $1
echo Postprocess $filename


ssed -r -i -f $root/ConTeXt/hyphenated.ssed $filename.tex
ssed -r -i -f $root/ConTeXt/thinrule.ssed $filename.tex
ssed -r -i -f $root/ConTeXt/iframe.ssed $filename.tex
ssed -r -i -f $root/ConTeXt/tables.ssed $filename.tex

echo ConTeXt $filename
context --batchmode $filename.tex > $filename.log 
#echo Showing
#subl contextRunLog.log
#subl pandoc.log
#evince $filename.pdf &
