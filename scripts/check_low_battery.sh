#!/bin/bash
# Source: https://unix.stackexchange.com/a/190155/337926

TOO_LOW=10 # how low is too low?
STATUS_NOT_CHARGING="Discharging"
ICON="/home/marco/Documents/low-battery.svg" # eye candy

#export DISPLAY=:0

BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
STATUS=$(cat /sys/class/power_supply/BAT0/status)

if [ $BATTERY_LEVEL -le $TOO_LOW -a $STATUS = $STATUS_NOT_CHARGING ]; then
    /usr/bin/notify-send -u critical -i "$ICON" -t 5000 "Battery low" "Battery level is ${BATTERY_LEVEL}%!"
fi

exit 0

