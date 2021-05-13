#!/bin/bash
# convert the original images to sequentially named
# images for the project.
# Example:
# "Watchmen - The Deluxe Edition-404.jpg" -> wm-12-23.jpg

# Usage: rename.sh 12
# run in the directory with the images

ch=$1
files=(*.jpg)
total=${#files[@]}
i=0
for f in "${files[@]}"; do
    printf -v newf 'wm-%s-%s.jpg' "$ch" "$i"
    mv "$f" "$newf"
    echo "$f -> $newf"
    i=$(( i + 1 ))
done
