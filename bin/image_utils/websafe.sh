#!/bin/bash

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

