#!/bin/bash

# ==========================================
# HEALTH CHECK SCRIPT
# ==========================================

LOG_DIR="/home/ubuntu/cron_automation_project/logs"
HEALTH_LOG="$LOG_DIR/health_report.log"

mkdir -p "$LOG_DIR"

echo "===================================="
echo "Starting Health Check"
echo "===================================="

echo "====================================" >> "$HEALTH_LOG"
echo "HEALTH REPORT - $(date)" >> "$HEALTH_LOG"
echo "====================================" >> "$HEALTH_LOG"

# Hostname
HOSTNAME=$(hostname)

echo "Hostname: $HOSTNAME"
echo "Hostname: $HOSTNAME" >> "$HEALTH_LOG"

# Uptime
UPTIME=$(uptime -p)

echo "System Uptime: $UPTIME"
echo "System Uptime: $UPTIME" >> "$HEALTH_LOG"

# Disk Usage
DISK=$(df -h / | awk 'NR==2 {print $5}')

echo "Disk Usage: $DISK"
echo "Disk Usage: $DISK" >> "$HEALTH_LOG"

# Memory Usage
MEMORY=$(free -m | awk 'NR==2 {printf "%.2f%%", $3*100/$2}')

echo "Memory Usage: $MEMORY"
echo "Memory Usage: $MEMORY" >> "$HEALTH_LOG"

# CPU Load
CPU=$(top -bn1 | grep "load average" | awk '{print $(NF-2)}')

echo "CPU Load: $CPU"
echo "CPU Load: $CPU" >> "$HEALTH_LOG"

# Running Services
echo "Checking Services..."

for service in ssh cron
do
    systemctl is-active --quiet $service

    if [ $? -eq 0 ]; then
        echo "$service service is running"
        echo "$service service is running" >> "$HEALTH_LOG"
    else
        echo "$service service is DOWN"
        echo "$service service is DOWN" >> "$HEALTH_LOG"
    fi
done

echo "===================================="
echo "Health Check Completed"
echo "===================================="
