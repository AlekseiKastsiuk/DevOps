#!/bin/bash
 
function rand() {
    echo $(($RANDOM % ${1}))
}
 
for item in $(seq 1 10)
do
    value="$(rand 100)"
    echo "[$item] => ${value}"
    arr[$item]=$value
done

max=${arr[1]}
min=${arr[1]}
summ=0

	for item in $(seq 1 10)
	do 
		if [ $max -lt ${arr[item]} ]; then
			max=${arr[item]}
		fi
		
		if [ $min -gt ${arr[item]} ]; then
			min=${arr[item]}
		fi
		
		let summ+=${arr[item]}
	done

echo max = $max
echo min = $min
echo summ = $summ


