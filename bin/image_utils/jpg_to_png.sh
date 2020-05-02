#!/bin/bash

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

