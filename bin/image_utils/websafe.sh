#!/bin/bash

# Use this after converting JPG to PNG.
#
# Creates websafe versions of the PNG images.
# Creates a folder named `websafe` in the source folder.
#
# Usage:
# expects a folder containing a PNG for each page of the chapter
# ~/Pictures/watchmen/Chapter01/png/*.png
#
# cd ~/Code/notes_on_watchmen/bin/image_utils
# $ ./websafe.sh ~/Pictures/watchmen/Chapter01/png

src=$1
dest="${src}/websafe"
mkdir -p $dest

list=(${src}/*.jpg);
#echo "${#list[@]}"
if [ ${#list[@]} -eq 1 ]; then
    list=(${src}/*.png);
    #echo "${#list[@]}"
fi


if [ ${#list[@]} -gt 1 ]; then
    for file in "${list[@]}"
    do
        base=$(basename -- "$file")
        extension="${base##*.}"
        filename="${base%.*}"

        echo "${dest}/${base}"
        convert ${file} -remap netscape: ${dest}/${base}
    done
fi
