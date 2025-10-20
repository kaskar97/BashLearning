#!/bin/bash

directory=$1
Log_file="changes.txt"

if [ ! -d "$directory" ]; then
    echo "Directory does not exist"
fi

fswatch -r $directory | while read event; do
    if [ -e $event ]; then
        echo "$(date + %Y-%M-%D %H:%M:%S) File modified/created: $event" >> "$Log_file"
    else
        echo "$(date + %Y-%M-%D %H:%M:%S) File deleted: $event" >> "$Log_file"

    fi
done