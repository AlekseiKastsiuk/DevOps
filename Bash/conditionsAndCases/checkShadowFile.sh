#!/bin/bash

echo ----------------------

sudo cat /etc/shadow &> /dev/null

if [ $(echo $?) -eq 0 ]; then 
	echo Command succeeded
else 
	echo Command failed
fi

