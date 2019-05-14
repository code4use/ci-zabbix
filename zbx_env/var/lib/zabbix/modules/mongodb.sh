#!/bin/bash
##################################################
# AUTHOR: Neo <netkiller@msn.com>
# WEBSITE: http://www.netkiller.cn
# Description£ºzabbix mongodb monitor
# Note£ºZabbix 3.2
# DateTime: 2016-11-23
##################################################
HOST=172.16.238.1
PORT=27017
USER=admin
PASS=mypass

index=$(echo $@ | tr " " ".")

status=$(echo "db.serverStatus().${index}" |mongo -u ${USER} -p ${PASS} admin --host ${HOST} --port ${PORT}|sed -n '3p')
 
#check if the output contains "NumberLong"
if [[ "$status" =~ "NumberLong"   ]];then
	echo $status|sed -n 's/NumberLong(//p'|sed -n 's/)//p'
else 
	echo $status
fi
