# Unlock id bluetooth card is locked (password requested)
if [[ $(rfkill -r | grep 'bluetooth hci0 blocked') = *bluetooth\ hci0\ blocked* ]]; then
  sudo rfkill unblock bluetooth
  echo "Bluetooth unlocked"
fi

# Turn off bluetooth if powerd on
if [[ $(bluetoothctl show | grep 'Powered: yes') = *Powered:\ yes* ]]; then
  # Disable bluetooth card
  bluetoothctl power off

  # Service now is enabled
  # sudo systemctl stop bluetooth.service
else
  echo "Already off"
fi
