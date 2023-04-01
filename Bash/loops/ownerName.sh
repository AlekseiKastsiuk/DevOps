#!/bin/bash
for file in * 
do 
    if [ -f "$file" ]; then 
	owner=$(ls -l $file | awk '{print $3}')
        echo Filename:"$file", Owner: $owner
    fi 
done


