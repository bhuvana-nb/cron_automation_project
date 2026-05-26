#!/bin/bash

LOG_DIR="/home/ubuntu/cron_automation_project/logs"
ARCHIVE_DIR="$LOG_DIR/archive"

mkdir -p "$ARCHIVE_DIR"

TIMESTAMP=$(date +%Y%m%d_%H%M%S)

echo "===================================="
echo "Starting Log Rotation"
echo "===================================="

for logfile in "$LOG_DIR"/*.log
do
    if [ -f "$logfile" ]; then

        BASENAME=$(basename "$logfile")

        mv "$logfile" "$ARCHIVE_DIR/${BASENAME}_$TIMESTAMP"

        touch "$logfile"

        echo "Rotated: $BASENAME"
    fi
done

find "$ARCHIVE_DIR" -type f -mtime +30 -delete

echo "Old archive logs deleted"

echo "===================================="
echo "Log Rotation Completed"
echo "===================================="
