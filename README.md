# BashLearning
## The Game: Bash Battle Arena 🎮
I started learning Bash scripting at CoderCo, and honestly, it turned out to be way more interesting than I expected. Along the way I picked up how to work with functions, conditionals, loops, exit codes, and even file checksums. What reinforced my learning was the assignment CoderCo set — a game-style challenge called The Game: Bash Battle Arena 🎮. It was a fun way to put everything I’d learned into practice and really understand how Bash can be used to automate and manage tasks efficiently. Below is a series of the questions set by CoderCo and my attempt at solving this.

## Level 1
Level 1: The Basics

Mission: Create a directory named Arena and then inside it, create three files: warrior.txt, mage.txt, and archer.txt. List the contents of the Arena directory.

Solution:
```bash
#!/bin/bash

mkdir Arena
cd Arena
touch warrior.txt mage.txt archer.txt
ls
```


## Level 2: Variables and Loops

Mission: Create a script that outputs the numbers 1 to 10, one number per line.

Solution:
```bash
#!/bin/bash

count=1

while [ $count -le 10 ]; do
    echo $count
    ((count++))
done
```

## Level 3: Conditional Statements

Mission: Write a script that checks if a file named hero.txt exists in the Arena directory. If it does, print Hero found!; otherwise, print Hero missing!.

Solution:
```bash
#!/bin/bash


if [[ -f Arena/hero.txt ]]; then
    echo "Hero found"
else 
    echo "Hero missing!"
fi
```

## Level 4: File Manipulation

Mission: Create a script that copies all .txt files from the Arena directory to a new directory called Backup.

Solution:
```bash
#!/bin/bash

mkdir -p Backup

cp Arena/*.txt Backup
```



## Level 5: The Boss Battle - Combining Basics

Mission: Combine what you've learned! Write a script that:

1. Creates a directory names 'Battlefield'
2. Inside Battlefield, create files named knight.txt, sorcerer.txt, and rogue.txt.
3. Check if knight.txt exists; if it does, move it to a new directory called Archive.
4. List the contents of both Battlefield and Archive.

Solution:
```bash
#!/bin/bash

mkdir -p Battlefield

touch Battlefield/knight.txt Battlefield/sorcerer.txt Battlefield/rogue.txt

if [[ -f Battlefield/knight.txt ]]; then
    mkdir -p Archive
    mv Battlefield/knight.txt Archive/
    echo "knight.txt has been moved to Archive"    
else
    echo "knight.txt does not exist"
fi 


echo "Contents of Battlefield:"
ls Battlefield
echo "Contents of Archive:"
ls Archive
```



## Level 6: Argument Parsing

Mission: Write a script that accepts a filename as an argument and prints the number of lines in that file. If no filename is provided, display a message saying 'No file provided'.

Solution:
```bash
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
```



## Level 7: File Sorting Script

Mission: Write a script that sorts all .txt files in a directory by their size, from smallest to largest, and displays the sorted list.

Solution:
```bash
directory=$1

if [[ -z "$directory" ]]; then
    echo "No directory provided"
fi

find "$directory" -type f -name "*.txt" -exec ls -lh {} + | sort -k 5,5 -h | awk '{ print $5, $9 }'
```



## Level 8: Multi-File Searcher

Mission: Create a script that searches for a specific word or phrase across all .log files in a directory and outputs the names of the files that contain the word or phrase.

Solution:
```bash
directory=$1
word=$2

find "$directory" -type f -name "*.log" -exec grep -l "$word" {} +

```


## Level 9: Script to Monitor Directory Changes

Mission: Write a script that monitors a directory for any changes (file creation, modification, or deletion) and logs the changes with a timestamp.

Solution:
```bash
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
```



## Level 10: Boss Battle 2 - Intermediate Scripting

Mission: Write a script that:

1. Creates a directory called Arena_Boss.
2. Creates 5 text files inside the directory, named file1.txt to file5.txt.
3. Generates a random number of lines (between 10 and 20) in each file.
4. Sorts these files by their size and displays the list.
5. Checks if any of the files contain the word 'Victory', and if found, moves the file to a directory called Victory_Archive.

Solution:
```bash
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
```
