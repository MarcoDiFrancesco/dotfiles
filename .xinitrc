# Start gnome-keyring-deamon
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
# Without this gnome keyring does not start
dbus-update-activation-environment --systemd DISPLAY
exec i3
