#!/bin/bash
magicNumber=$(( $RANDOM % 100 ))
#echo cheat $magicNumber
while(true)
do
read answer
	if [ $answer -lt $magicNumber ]; then
		echo greater
	fi

	if [ $answer -gt $magicNumber ]; then
		echo less
	fi
	
	if [ $answer -eq $magicNumber ]; then
		echo You win!
		break
	fi
	
	
done
