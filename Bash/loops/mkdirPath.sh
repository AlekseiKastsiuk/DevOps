#!/bin/bash

while read line; do    
    echo $line   
	if [[ $line == "/tmp/"*"/" ]]; then
		mkdir $line
	else 
		touch $line
	fi
done < paths
