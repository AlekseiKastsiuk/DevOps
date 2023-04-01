#!/bin/bash

function Summ_prod() {
arr=("$@")
summ=0
prod=1

for i in "${arr[@]}";
	do
		let summ+=$i
		let prod*=$i
	
	done

echo Sum: $summ
echo Prod: $prod
}


Summ_prod "$@"
