#!/bin/bash
parsing() {
path="${1}"
echo $path
newpath=$(echo $path | sed 's/accounts.csv/accounts_new.csv/g')
echo -n > $newpath 


exec < $path
read header
echo $header >> $newpath



csvformat -D "|" < <(tail -n +2 $path) | while IFS="|" read idd location_id name title email department
do

	name=( $name )		
	newname="${name[@]^}" 	


	email=${name[0]:0:1}${name[1]} 	
	email="${email,,}" 		

	samecount=$(grep -c $email $newpath) 



	if [ $samecount -eq 0 ]; then
		echo $idd,$location_id,$newname,\"$title\","$email@abc",$department >> $newpath
	else
		echo $idd,$location_id,$newname,\"$title\","$email$location_id@abc",$department >> $newpath
	fi
done
}

parsing "$1" 

