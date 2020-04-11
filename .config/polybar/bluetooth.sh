#!/bin/sh
# Credits to https://github.com/polybar/polybar-scripts/tree/master/polybar-scripts/system-bluetooth-bluetoothctl

bluetooth_print() {
    while true; do
        if [ "$(systemctl is-active "bluetooth.service")" = "active" ]; then
            if [[ "$(bluetoothctl show | grep 'Powered: yes')" = *Powered:\ yes ]]; then
                if [[ "$(bluetoothctl info $1 | grep "Connected: yes")" = *Connected:\ yes ]]; then
                    # Connected
                    printf "%s" ""
                else
                    # Disconnected
                    printf "%s" "%{F#66ffffff}"
                fi
                if [ $1 = "CD:9F:B9:BD:FA:F4" ]; then
                    # Mouse
                    printf "%s" ""
                elif [ $1 = "1C:52:16:3A:9A:65" ]; then
                    # Headphones
                    printf "%s" ""
                fi
                printf '\n'
            else
                # Disconnected
                # Print disconnected only in one device
                if [ $1 = "CD:9F:B9:BD:FA:F4" ]; then
                    echo "%{F#66ffffff}"
                elif [ $1 = "1C:52:16:3A:9A:65" ]; then
                    echo ""
                fi
            fi
        else
            echo "Bluetooth module disabled"
        fi
        sleep 1 &
        wait
    done
}

toggle_device() {
    # Avoiding cases when the bluetooth card is off
    if [[ "$(bluetoothctl info $1 | grep "Connected: no")" = *Connected:\ no ]]; then
        bluetoothctl connect $1
    elif [[ "$(bluetoothctl info $1 | grep "Connected: yes")" = *Connected:\ yes ]]; then
        bluetoothctl disconnect $1
    fi
}

toggle_bluetooth() {
    if [[ "$(bluetoothctl show | grep 'Powered: no')" = *Powered:\ no ]]; then
        bluetoothctl power on
    elif [[ "$(bluetoothctl show | grep 'Powered: yes')" = *Powered:\ yes ]]; then
        bluetoothctl power off
    fi
}

case "$1" in
    --toggle-bluetooth)
        toggle_bluetooth
        ;;
    --toggle-headphones)
        toggle_device 1C:52:16:3A:9A:65
        ;;
    --toggle-mouse)
        toggle_device CD:9F:B9:BD:FA:F4
        ;;
    --print-headphones)
        bluetooth_print 1C:52:16:3A:9A:65
        ;;
    --print-mouse)
        bluetooth_print CD:9F:B9:BD:FA:F4
        ;;
    *)
        bluetooth_print
        ;;
esac
