#!/bin/bash

mkdir -p Arena_Boss

for i in Arena_Boss/file{1..5}.txt; do
    Lines=$((RANDOM % 11 + 10))
    for j in $(seq 1 $Lines); do 
        echo "This is line $j" >> "$i" 
    done
done

echo "Files sorted by size:"
directory=Arena_boss

find $directory -type f -name "*.txt" -exec ls -lh {} + | sort -k 5,5 | awk '{print $5, $9}'

mkdir -p Victory_Archive

for i in Arena_Boss/*.txt; do

    if grep -q "Victory" "$i"; then
        mv $i Victory_Archive/
        echo "$i contains the word Victory and has been moved to Victory_Archive"
    else
        echo "Word not found"
    fi
done






