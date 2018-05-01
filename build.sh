#!/usr/bin/env bash

set -e

rm -rf Options.tex

if [ -d ".git" ]; then

SHA=`git rev-parse --short --verify HEAD`
DATE=`git show -s --format="%cd" --date=short HEAD`
REV="$SHA - $DATE"
echo "\renewcommand\DicetherPaperVersionNumber{$REV}" >> Options.tex

fi

rm -rf build
mkdir -p build
pdflatex -output-directory=build -interaction=errorstopmode -halt-on-error paper.tex && \
biber build/paper && \
pdflatex -output-directory=build -interaction=errorstopmode -halt-on-error paper.tex && \
pdflatex -output-directory=build -interaction=errorstopmode -halt-on-error paper.tex && \
pdflatex -output-directory=build -interaction=errorstopmode -halt-on-error paper.tex && \
rm -rf Options.tex
