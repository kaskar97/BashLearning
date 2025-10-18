#!/bin/bash
: 'directory=$1
if [[ -z $directory ]]; then
    echo "No directory provided"
    exit 1
fi

if compgen -G "$directory/*.txt" > /dev/null; then
    ls -lh "$directory"/*.txt | sort -k 5,5 -h | awk '{ print $5, $9}'
    
else
    echo "No .txt files found in $directory"
fi 
'





: ' DIRECTORY="Battlefield"

if [ ! -d "$DIRECTORY" ]; then
    echo "Directory does not exist."
    exit 1
fi

find "$DIRECTORY" -type f -name "*.txt" -exec ls -lh {} + | sort -k 5,5 -h |
'

directory=$1

if [[ -z "$directory" ]]; then
    echo "No directory provided"
fi

find "$directory" -type f -name "*.txt" -exec ls -lh {} + | sort -k 5,5 -h | awk '{ print $5, $9 }'

