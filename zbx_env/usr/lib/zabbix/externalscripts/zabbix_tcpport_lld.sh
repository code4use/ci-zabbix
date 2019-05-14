#!/bin/sh

FIRSTLINE=1

echo '{'
echo ' "data":['

nmap -T4 -F ${1} | grep 'open' | while read portproto state protocol ; do
port=$(echo ${portproto} | cut -d/ -f1)
proto=$(echo ${portproto} | cut -d/ -f2)
if [ "$FIRSTLINE" = "1" ] ; then
   FIRSTLINE=0
else
   echo ","
fi

echo -n '  { "{#PORT}":"'${port}'", "{#PROTO}":"'${proto}'" }'
done

echo '\n ]'
echo '}'

