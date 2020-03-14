#!/bin/bash

pamixer --unmute

# Get increase (-i) decrease (-d) mute (-m)
while getopts 'idm' flag
do
  case "${flag}" in
    i)
        pamixer -i 5
    ;;
    d)
        pamixer -d 5
    ;;
    m)
        pamixer --set-volume 0
    ;;
  esac
done
