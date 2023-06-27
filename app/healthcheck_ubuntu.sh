#!/usr/bin/sh
if test -f "$HEALTHCHECK_INTERVAL_FILE"; then
    MAX_AGE=$(cat $HEALTHCHECK_INTERVAL_FILE)
else
    echo "Unhealthy - max_age file not found"
    exit 1
fi
if test -f "$HEALTHCHECK_HEARTBEAT_FILE"; then
    CURTIME=$(date +%s)
    FILETIME=$(stat $HEALTHCHECK_HEARTBEAT_FILE -c %Y)
    TIMEDIFF=$(expr $CURTIME - $FILETIME)
    if [ $TIMEDIFF -gt $MAX_AGE ]; then
        echo "Unhealthy - heartbeat file too old"
        exit 1;
    else
        echo "Healthy"
        exit 0;
    fi
else
    echo "Unhealthy - heartbeat file not found"
    exit 1
fi
