#!/bin/bash

# Converts the JPG images of the book into PNG images.
# Creates a folder named `png` in the source folder.
#
# Usage:
# expects a folder containing a JPG for each page of the chapter
# ~/Pictures/watchmen/Chapter01/*.jpg
#
# cd ~/Code/notes_on_watchmen/bin/image_utils
# $ ./jpg_to_png.sh ~/Pictures/watchmen/Chapter01

src=$1
dest="${src}/png"
mkdir -p $dest

for file in "$src"/*.jpg;
do
    base=$(basename -- "$file")
    extension="${base##*.}"
    filename="${base%.*}"

    newf="${dest}/${filename}.png"
    echo $newf
    convert ${file} -colors 256 $newf
done
