#!/bin/bash
#
# Shuts down the host when there are no active SSH sessions for 2 hours
# Useful when running expensive EC2 machines that you're only using for
# development
#
# To enable, add this entry to the sudo crontab:
# */5 * * * *  root  <scriptpath>/check_ssh_sessions >> /var/log/check_ssd_sessions.log 2>&1
# This will run the script every 5 minutes
#
ACTIVE_SESSIONS=$(netstat | grep ssh | grep ESTABLISHED | wc -l)
TIMESTAMP_FILE="/tmp/last_ssh_session.txt"

echo "[$(date)] Running check_ssh_sessions.sh"

# If the timestamp file doesn't exist, create it with the current date
if [ ! -f "$TIMESTAMP_FILE" ]; then
    echo "- No timestamp file found, creating"
    date +%s > "$TIMESTAMP_FILE"
fi

# If there are no active sessions, check the timestamp
if [ "$ACTIVE_SESSIONS" -eq "0" ]; then
    echo "- No active SSH sessions"
    LAST_TIMESTAMP=$(cat "$TIMESTAMP_FILE")
    CURRENT_TIMESTAMP=$(date +%s)
    DIFFERENCE=$((CURRENT_TIMESTAMP - LAST_TIMESTAMP))

    echo "- $DIFFERENCE seconds since last SSH session"
    # If it's been more than 2 hours (7200 seconds) since the last SSH session
    if [ "$DIFFERENCE" -gt "7200" ]; then
      echo "- Shutting down"
      poweroff  # See https://unix.stackexchange.com/a/196014/56711
    fi
else
    echo "- Active SSH session found, updating timestamp"
    # If there's an active SSH session, update the timestamp
    date +%s > "$TIMESTAMP_FILE"
fi
