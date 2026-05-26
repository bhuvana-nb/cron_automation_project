#!/bin/bash

# ==========================================
# SYSTEM MONITORING SCRIPT
# ==========================================

LOG_DIR="/home/ubuntu/cron_automation_project/logs"
LOG_FILE="$LOG_DIR/monitor.log"

mkdir -p "$LOG_DIR"

# Thresholds
DISK_THRESHOLD=80
CPU_THRESHOLD=75
MEMORY_THRESHOLD=80

# Logging function
log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

# Header

echo "===================================="
echo "Starting System Monitoring"
echo "===================================="

# ==========================================
# DISK USAGE
# ==========================================

DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

log_message "Disk Usage: ${DISK_USAGE}%"

echo "Disk Usage: ${DISK_USAGE}%"

if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then

    echo "WARNING: Disk usage exceeded threshold"

    log_message "WARNING: Disk usage exceeded threshold"

fi

# ==========================================
# CPU USAGE
# ==========================================

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

CPU_INT=${CPU_USAGE%.*}

log_message "CPU Usage: ${CPU_USAGE}%"

echo "CPU Usage: ${CPU_USAGE}%"

if [ "$CPU_INT" -gt "$CPU_THRESHOLD" ]; then

    echo "WARNING: CPU usage exceeded threshold"

    log_message "WARNING: CPU usage exceeded threshold"

fi

# ==========================================
# MEMORY USAGE
# ==========================================

MEMORY_USAGE=$(free | awk '/Mem:/ {printf("%.0f", $3/$2 * 100.0)}')

log_message "Memory Usage: ${MEMORY_USAGE}%"

echo "Memory Usage: ${MEMORY_USAGE}%"

if [ "$MEMORY_USAGE" -gt "$MEMORY_THRESHOLD" ]; then

    echo "WARNING: Memory usage exceeded threshold"

    log_message "WARNING: Memory usage exceeded threshold"

fi

# ==========================================
# SERVICES CHECK
# ==========================================

SERVICES=(ssh cron)

for service in "${SERVICES[@]}"
do

    systemctl is-active --quiet "$service"

    if [ $? -eq 0 ]; then

        echo "$service service is running"

        log_message "$service service is running"

    else

        echo "ERROR: $service service is DOWN"

        log_message "ERROR: $service service is DOWN"

    fi

done

# ==========================================
# FAILED LOGIN ATTEMPTS
# ==========================================

if [ -f /var/log/auth.log ]; then

    FAILED_LOGINS=$(grep "Failed password" /var/log/auth.log | wc -l)

    echo "Failed Login Attempts: $FAILED_LOGINS"

    log_message "Failed Login Attempts: $FAILED_LOGINS"

fi

# Footer

echo "===================================="
echo "System Monitoring Completed"
echo "===================================="
