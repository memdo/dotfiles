#!/bin/sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

xrandr --addmode HDMI-A-0 "1920x1080_75.50"
xrandr --output HDMI-A-0 --mode "1920x1080_75.50"

xrdb -load .Xresources

polybar main &
