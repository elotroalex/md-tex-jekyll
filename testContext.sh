#!/bin/bash

set -euo pipefail

rm -rf ConTeXtUnitTestOutput
mkdir ConTeXtUnitTestOutput

root=$(git rev-parse --show-toplevel)

for dir in $(find unitTestMarkdowns/ -mindepth 1 -maxdepth 1 -type d); do
	cp -r $dir ConTeXtUnitTestOutput
done

for dir in $(find ConTeXtUnitTestOutput/ -mindepth 1 -maxdepth 1 -type d); do
	cp $root/ConTeXt/env_journal.tex $dir/
	cd $dir
	for file in $(find . -name "*.md"); do		
		
		$root/ConTeXt/convert.sh $file $dir
	done	
	cd ..
done	

