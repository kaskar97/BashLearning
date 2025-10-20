#!/bin/bash

count=1

while [ $count -le 10 ]; do
    echo $count
    ((count++))
done


: 'for i in {1..10}
do  echo $i
done
'
