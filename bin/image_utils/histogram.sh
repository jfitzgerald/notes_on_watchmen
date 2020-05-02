#!/bin/bash

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

