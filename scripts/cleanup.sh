#!/bin/bash

# ==========================================
# CLEANUP SCRIPT
# ==========================================

LOG_DIR="/home/ubuntu/cron_automation_project/logs"
CLEANUP_LOG="$LOG_DIR/cleanup.log"

mkdir -p "$LOG_DIR"

echo "===================================="
echo "Starting Cleanup Process"
echo "===================================="

echo "[$(date)] Cleanup Started" >> "$CLEANUP_LOG"

# Clean user temp files only
find /tmp -type f -user ubuntu -mtime +2 2>/dev/null -delete

echo "Temporary files cleaned"

# Remove old logs
find "$LOG_DIR" -type f -name "*.log" -mtime +15 -delete

echo "Old logs deleted"

# Remove old backups
find /home/ubuntu/cron_automation_project/backups \
-type f -name "*.tar.gz" -mtime +7 -delete

echo "Old backups deleted"

echo "[$(date)] Cleanup Completed" >> "$CLEANUP_LOG"

echo "===================================="
echo "Cleanup Completed Successfully"
echo "===================================="
