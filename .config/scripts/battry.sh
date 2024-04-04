#!/usr/bin/env bash

battery_percentage=$(cat /sys/class/power_supply/BAT*/capacity | awk '{s+=$1} END {print int(s/NR)}')

if [ "$battery_percentage" -le 90 ]; then
    dunstify --urgency=critical "Battery Low" "Battery level is ${battery_percentage}%. Please connect the charger!"
fi
