#!/usr/bin/sh
FILE=/app/heartbeat
OLDTIME=3610
CURTIME=$(date +%s)
FILETIME=$(stat $FILE -c %Y)
TIMEDIFF=$(expr $CURTIME - $FILETIME)
if [ $TIMEDIFF -gt $OLDTIME ]; then
   exit 1;
else 
   exit 0;
fi
