mv ~/.history /tmp/history_temp
# Overwrite all to .history
strings /tmp/history_temp > ~/.history
# fc -R ~/.history
# rm /tmp/history_temp
