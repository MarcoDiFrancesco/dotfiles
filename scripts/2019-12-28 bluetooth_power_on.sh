# Service now is enabled
# sudo systemctl start bluetooth.service

# Unlock id bluetooth card is locked (password requested)
if [[ $(rfkill -r | grep 'bluetooth hci0 blocked') = *bluetooth\ hci0\ blocked* ]]; then
  sudo rfkill unblock bluetooth
  echo "Bluetooth unlocked"
fi

# Turn on bluetooth if powerd on
if [[ $(bluetoothctl show | grep 'Powered: no') = *Powered:\ no* ]]; then
  # Enable bluetooth card
  bluetoothctl power on
else
  echo "Already on"
fi
