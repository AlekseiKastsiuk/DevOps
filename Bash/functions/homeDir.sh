#!/bin/bash
function Home_dir(){
    Name="${1}" 
eval echo "~$Name"
}
Home_dir "$1"




