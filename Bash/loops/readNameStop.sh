#!/bin/bash

while(true)
do
 	read name

	if [ $name != "Stop" ]; then 
		echo Hello $name
	else break
	fi
done
