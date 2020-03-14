#!/bin/bash

pic_name="/home/marco/Pictures/screenshot_$(date +"%Y-%m-%d")_$(date +"%H-%M-%S").png"

# Get imgur (-i) local (-l) cropped (-c)
while getopts 'ilc' flag
do
  case "${flag}" in
    i)
        /home/marco/Documents/imgur-screenshot/imgur-screenshot
    ;;
    l)
        scrot $pic_name
    ;;
    c)
        scrot -s $pic_name
    ;;
  esac
done
