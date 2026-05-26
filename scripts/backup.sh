#!/bin/bash

# ==========================================
# SIMPLE WORKING BACKUP SCRIPT
# ==========================================

# Variables
BACKUP_SOURCE="/home/ubuntu/project_data"
BACKUP_DESTINATION="/home/ubuntu/cron_automation_project/backups"
LOG_DIR="/home/ubuntu/cron_automation_project/logs"
LOG_FILE="$LOG_DIR/backup.log"

# Create folders if not exist
mkdir -p "$BACKUP_DESTINATION"
mkdir -p "$LOG_DIR"

# Timestamp
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="backup_$TIMESTAMP.tar.gz"

# Display message
echo "===================================="
echo "Starting Backup Process"
echo "===================================="

# Run backup

tar -czf "$BACKUP_DESTINATION/$BACKUP_FILE" "$BACKUP_SOURCE" 2>> "$LOG_FILE"

# Check backup status
if [ $? -eq 0 ]; then

    echo "Backup completed successfully"

    echo "[$(date)] Backup Success: $BACKUP_FILE" >> "$LOG_FILE"

else

    echo "Backup failed"

    echo "[$(date)] Backup FAILED" >> "$LOG_FILE"

fi

# Finish message

echo "===================================="
echo "Backup Script Finished"
echo "===================================="
