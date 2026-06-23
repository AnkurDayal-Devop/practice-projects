#!/bin/bash

FILE="/home/admin-gn/projects/tony.log"
LOGFILE="/home/admin-gn/projects/tony.log"

CURRENT_MINUTE=$(date +%M)
MINUTE_IN_BLOCK=$((10#$CURRENT_MINUTE % 10))

if [ -f "$FILE" ] && [ "$MINUTE_IN_BLOCK" -lt 5 ]; then
    echo "$(date)" > "$LOGFILE"
   echo " File exists and this is the first 5 minutes of the 10-minute block" >> "$LOGFILE"
    echo "THIS MESSAGE SHOWS BEFORE .05, .15, .25, .35, .45, AND .55 OF EVERY HOUR" >> "$LOGFILE"
else
    echo "YOU ARE IN THE SECOND 5 MINUTES OF THE 10-MINUTE BLOCK" > "$LOGFILE"
    echo "THIS MESSAGE SHOWS AFTER .05 AND BEFORE .10, AFTER .15 AND BEFORE .20, AND SO ON" >> "$LOGFILE"
    echo "NOW IT IS $(date): File is missing or the second 5-minute window is active" >> "$LOGFILE"
fi
