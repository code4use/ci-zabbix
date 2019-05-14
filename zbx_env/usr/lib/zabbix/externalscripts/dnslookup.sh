#!/bin/bash
#/etc/zabbix/externalscripts/dnslookup.sh
#

HOST_QUERY=$1
# Check for \. in url
echo "$HOST_QUERY" | grep -qP "\S+\.\S+"
if [ $? -ne 0 ] ; then
    # Not URL, do not check
    echo 1
    exit 0
fi
# start real checks
if [ `host -W 1 $HOST_QUERY | grep "has address" | wc -l` -eq 0 ]; then
    #FAIL
    echo "0"
else
    #OK
    echo "1"
fi

