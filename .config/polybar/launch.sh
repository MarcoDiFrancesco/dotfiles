## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#polybar top -c ~/.config/polybar/config-top.ini &
# polybar example >> /tmp/polybar.log 2>&1 &

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar bar1 >> /tmp/polybar1.log 2>&1 &
polybar bar2 >> /tmp/polybar2.log 2>&1 &