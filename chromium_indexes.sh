#!/bin/bash

cat SampleSheet.csv | grep -v ',,,' > upperPart.csv
cat SampleSheet.csv | grep  ',,,' > lowerpart.csv
cat SampleSheet.csv | grep  ',,,' | grep -oP '(?<=,,,,).*?(?=,)' > tmp.txt
while read p; do cat chromium_sample_indexes.csv | grep $p | awk '{printf "%s\n", $1}'; done < tmp.txt > indexes.tmp

Rscript chromium_indexes.R # R script has to be in the same folder!

cat lower_new.csv >> upperPart.csv
mv upperPart.csv SampleSheetWith10xIndexes.csv
