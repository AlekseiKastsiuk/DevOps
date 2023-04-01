#!/bin/bash
parsingjson() {

outputfile="${1}"
outputfilejson=`echo $outputfile | sed s/output.txt/output.json/g` #creating path for new json file


echo -n > $outputfilejson #delete old json file

exec < $outputfile
read header
testname=`echo $header | awk -F"[][]" '{print $2}'` #take test name from first line

echo -n '{"testName":"'$testname'","tests":[' >> $outputfilejson #add test name to file


tail -n +3 $outputfile | while read -r line #start loop without first 2 lines to line with "------"
do
	if [[ $line == "-----------------------------------------------------------------------------------" ]]
	then 
		break
	else	
		name=`echo $line | awk -F' [0-9]+' '{print $2}' | sed -e "s/^.//;s/.$//"` 	#take value between numbers and dellete first and last symbols
		status=`echo $line | awk -F' [0-9]' '{print $1}'`				#take first value before number
		duration=`echo $line | awk -F'), ' '{print $2}'` 				#take thecond part after "), "

		if [[ $status == "ok" ]] #change status from "ok/not ok" to bool true/false
		then
			status=true
 		else
			status=false
		fi

		echo -n '{"name":"'$name'", "status":'$status', "duration":"'$duration'"},' >> $outputfilejson #add test values to file 
		
	
	fi  

done

successout=`tail -n 1 $outputfile | awk '{print $1}'` 				#take first value from last line
failedout=`tail -n 1 $outputfile | grep -o -P '(?<=, ).*(?= tests failed)'` 	#take value between ", " and " tests failed" from last line
ratingout=`tail -n 1 $outputfile | grep -o -P '(?<=as ).*(?=%,)'` 		#take value between "as " and "%," from last line
durationout=`tail -n 1 $outputfile | grep -oE '[^ ]+$'`				#take last value after [[:space:]] from last line

echo -n '],"summary":{"success":'$successout',"failed":'$failedout',"rating":'$ratingout',"duation":"'$durationout'"}}' >> $outputfilejson #add all before to file 



jsontxt=`cat $outputfilejson | sed 's/},]/}]/g'` 	#dell extra comma, adjust to the json format
echo -n > $outputfilejson				#dell clear the file
echo $jsontxt | jq '.' >> $outputfilejson		#add to file all text in json format

}



parsingjson "$1" #calling function
















