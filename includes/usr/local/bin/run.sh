#!/bin/bash

shopt -s globstar

date=$(date '+%Y-%m-%d-%H-%M-%S')

cd /images
mkdir converted-${date}

for i in *.*; do
  filename=$(basename "$i")
  newname="${filename%.*}"
  echo "${i}"
  convert "${i}" -resize "800x800>" -auto-orient -strip "converted-${date}/${newname}.jpg"
done