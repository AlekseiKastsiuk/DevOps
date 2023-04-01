#!/bin/bash

function Sleeping() {

if [[ -z $(ps -ef | grep "[s]leep 1000") ]]; then
	echo "Starting sleep 1000"
	sleep 1000 &
else 
	echo "Sleep 1000 is working"
fi

}


Sleeping