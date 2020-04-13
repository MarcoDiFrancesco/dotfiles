# URXVT config file
exec /usr/bin/xrdb /home/marco/.config/urxvt/Xresources &
# Map super keys
exec /usr/bin/xmodmap /home/marco/.config/xmodmaprc/change_super_key &
# Urxvt daemon
urxvtd -q &
# Clipboard daemon
clipster -d &