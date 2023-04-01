#!/bin/bash
party(){
age="${1}"
yn="${2}"

if [ $age -ge 18 ]; then
	echo "you can go"
else
	if [ $yn = "yes"  ] ;then 
		echo "You may go but must be back before midnight."
	else
		echo "You can't go"
	fi
fi

}
party "$1" "$2"
