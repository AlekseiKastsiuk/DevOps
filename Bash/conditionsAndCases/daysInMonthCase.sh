#!/bin/bash

ThisMonth=$(date +"%m")

case $ThisMonth in 
    01|03|05|07|08|10|12) echo 31;;
    04|06|09|11) echo 30;;
    02) echo 28;;
esac