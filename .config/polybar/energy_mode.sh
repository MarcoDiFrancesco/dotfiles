#!/bin/sh

get_energy_mode() {
  while true; do
    if [ "$(cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor | grep performance)" ]; then
      # Performance color
      printf "%s" ""
    else
      # Powersafe color
      printf "%s" "%{F#66ffffff}"
    fi
    # Bolt icon
    printf "%s" ""
    printf '\n'
    sleep 1 &
    wait
  done
}

case "$1" in
*)
  get_energy_mode
  ;;
esac
