#!/bin/bash
# Source: https://unix.stackexchange.com/a/190155/337926

ICON="/home/marco/Documents/low-battery.svg" # eye candy

BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
TOO_LOW=100

STATUS=$(cat /sys/class/power_supply/BAT0/status)
STATUS_NOT_CHARGING="Discharging"

if [ $BATTERY_LEVEL -le $TOO_LOW -a "$STATUS" = $STATUS_NOT_CHARGING ]; then
    # Send notification that lasts for 5 minutes
    /usr/bin/notify-send -u critical -i "$ICON" -t 300000 "Battery low" "Battery level is ${BATTERY_LEVEL}%!"
fi

exit 0

