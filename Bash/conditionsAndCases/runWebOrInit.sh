#!/bin/bash
varhttp=$(ps -ef |grep -v grep |grep -cw httpd)
varinit=$(ps -ef |grep -v grep |grep -cw init)


if [ $varhttp -gt 0 ];  then 
echo "This machine is running a web server."
fi

if [ $varinit -gt 0 ];  then 
echo "This machine is running a init daemons."
fi

