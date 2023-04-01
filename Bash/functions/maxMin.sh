#!/bin/bash

function Max_min() {
arr=("$@")
max=${arr[0]}
min=${arr[0]}

for i in "${arr[@]}";
	do
	
		if [ $max -lt $i ]; then
			max=$i
		fi
		
		if [ $min -gt $i ]; then
			min=$i
		fi	
	
	done
echo max = $max
echo min = $min
}


Max_min "$@"
