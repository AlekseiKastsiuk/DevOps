#!/bin/bash

check_file(){

Dir="${1}"
for filename in $Dir*
do
	echo File: $filename
                                                                                        
	if test -f $filename                                                                                      
	then                                                                                                      
       		echo "type: regular file"  
                                                                           
		elif test -d $filename   
	then                                                                                                  
 	      	echo "Type: dir"  
	else 
		echo "type: other"               
	fi   

	stat --printf=$(Permissions: %a/%A\n) $filename 

	echo ------------------------------------
done 
}

check_file ${1}
