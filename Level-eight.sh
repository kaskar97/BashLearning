#!/bin/bash

directory=$1
word=$2

find "$directory" -type f -name "*.log" -exec grep -l "$word" {} +

