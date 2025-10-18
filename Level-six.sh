#!/bin/bash

file_path="$1"
if [[ -z $file_path ]]; then
    echo "No file provided"
    exit 1
elif [[ -f $file_path ]]; then
    count=$(wc -l < "$file_path")
    echo "Number of lines in $file_path is: $count"
else
    echo "File does not exist"
    exit 1
fi


