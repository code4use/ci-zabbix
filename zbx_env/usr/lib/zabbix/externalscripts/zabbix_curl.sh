#!/bin/sh
#
echo "$*" | grep -qP "\S+\.\S+"

if [ $? -ne 0 ] ; then
 echo NOURL
 exit 0
fi

RETVAL=`curl -sS --retry 1 -w %{http_code} -o /dev/null "$@" 2>&1`

if [ $? -eq 0 ] ; then
 echo -n HTTP $RETVAL "\n"
else
 echo -n ERROR $RETVAL "\n"
fi

