#!/bin/bash

###########################################
# Author: Pratyush
# Date: 25/08/2023
#
# This script can be used to monitor server resources(CPU, memory, disk usage) and send an alert if any resource exceeds a certain threshold.
#
# Version: v1
###########################################


cpu_threshold=90
memory_threshold=90
disk_threshold=90

while true; do
    cpu_usage=$(top -bn 1 | awk '/Cpu/ {print 100 - $8}')
    memory_usage=$(free | awk '/Mem:/ {print $3/$2 * 100.0}')
    disk_usage=$(df -h / | awk '/\// {print $5}' | tr -d '%')

    echo "$(date) --> CPU Usage: $cpu_usage% | Memory Usage: $memory_usage% | Disk Usage: $disk_usage%"

    if (( $(echo "$cpu_usage >= $cpu_threshold" | bc -l) )); then
        echo "High CPU usage: $cpu_usage%"
    fi

    if (( $(echo "$memory_usage >= $memory_threshold" | bc -l) )); then
        echo "High memory usage: $memory_usage%"
    fi

    if (( $(echo "$disk_usage >= $disk_threshold" | bc -l) )); then
        echo "High disk usage: $disk_usage%"
    fi

    sleep 300  # Sleep for 5 minutes before checking again
done
