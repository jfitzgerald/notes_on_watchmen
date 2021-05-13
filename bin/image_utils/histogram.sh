#!/bin/bash

# Use this after creating websafe PNG files.
#
# Creates a histogram file for each page image.
# Creates a folder named `hist` in the source folder.
#
# Usage:
# expects a folder containing a websafe PNG for each page of the chapter.
# ~/Pictures/watchmen/Chapter01/png/websafe/*.png
#
# cd ~/Code/notes_on_watchmen/bin/image_utils
# $ ./websafe.sh ~/Pictures/watchmen/Chapter01/png/websafe

src=$1
dest="${src}/hist"
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

        newf="${dest}/${filename}.txt"
        echo $newf
        convert ${file} -format %c histogram:info:${newf}
    done
fi
