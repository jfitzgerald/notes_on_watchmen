#!/bin/bash

src=$1
dest="${src}/resize"
mkdir -p $dest

for file in "$src"/*.jpg;
do
    base=$(basename -- "$file")
    extension="${base##*.}"
    filename="${base%.*}"

    echo "${dest}/${base}"
    convert ${file} -resize 50% ${dest}/${base}
done

