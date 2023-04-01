#!/bin/bash
array=$(seq 1 100)
for item in ${array}; do

	if [ $item -gt 85 ]; then
		break
	fi

	if [ $(($item%2)) -eq 0 ] && [ $item -lt 30 ]; then
		echo $item
	fi

	if [ $(($item%2)) -eq 0 ] && [ $item -gt 60 ]; then
		echo $item
	fi

	
done

