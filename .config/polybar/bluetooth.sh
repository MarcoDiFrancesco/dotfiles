#!/bin/sh
# Credits to https://github.com/polybar/polybar-scripts/tree/master/polybar-scripts/system-bluetooth-bluetoothctl

MAC_MOUSE=CA:C9:FC:48:31:81
MAC_HEADPHONES=1C:52:16:3A:9A:65

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
                if [ $1 = $MAC_MOUSE ]; then
                    # Mouse
                    printf "%s" ""
                elif [ $1 = $MAC_HEADPHONES ]; then
                    # Headphones
                    printf "%s" ""
                fi
                printf '\n'
            else
                # Disconnected
                # Print disconnected only in one device
                if [ $1 = $MAC_MOUSE ]; then
                    echo "%{F#66ffffff}"
                elif [ $1 = $MAC_HEADPHONES ]; then
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
        echo "Bluetooth powered on"
    elif [[ "$(bluetoothctl show | grep 'Powered: yes')" = *Powered:\ yes ]]; then
        echo "Bluetooth already off"
        bluetoothctl power off
    fi
}

case "$1" in
    --toggle-bluetooth)
        toggle_bluetooth
        ;;
    --toggle-headphones)
        toggle_device $MAC_HEADPHONES
        ;;
    --toggle-mouse)
        toggle_device $MAC_MOUSE
        ;;
    --print-headphones)
        bluetooth_print $MAC_HEADPHONES
        ;;
    --print-mouse)
        bluetooth_print $MAC_MOUSE
        ;;
    *)
        bluetooth_print
        ;;
esac
