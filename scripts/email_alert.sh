#!/bin/bash

# ==========================================
# EMAIL ALERT SIMULATION SCRIPT
# ==========================================

LOG_DIR="/home/ubuntu/cron_automation_project/logs"
ALERT_LOG="$LOG_DIR/alerts.log"

mkdir -p "$LOG_DIR"

MESSAGE=$1

# Default message if empty
if [ -z "$MESSAGE" ]; then
    MESSAGE="No alert message provided"
fi

# Display alert

echo "===================================="
echo "SYSTEM ALERT"
echo "===================================="
echo "$MESSAGE"
echo "===================================="

# Save to log

echo "[$(date '+%Y-%m-%d %H:%M:%S')] ALERT: $MESSAGE" >> "$ALERT_LOG"
