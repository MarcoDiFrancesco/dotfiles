# Unlock id bluetooth card is locked (password requested)
if [[ $(rfkill -r | grep 'wlan phy0 blocked') = *wlan\ phy0\ blocked* ]]; then
  sudo rfkill unblock wlan
  echo "Wlan unlocked"
fi

if [[ $(nmcli device show wlp3s0 | grep 'GENERAL.STATE: * 30 (disconnected)') = *GENERAL.STATE:*30* ]]; then
  echo "Already off"
else 
  nmcli device disconnect wlp3s0
  echo "Wlan turned off"
fi