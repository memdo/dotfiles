#!/bin/sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

xrandr --newmode "1920x1080_75.50"  222.25  1920 2064 2264 2608  1080 1083 1088 1130 -hsync +vsync
xrandr --addmode HDMI-A-0 "1920x1080_75.50"
xrandr --output HDMI-A-0 --mode "1920x1080_75.50"

nitrogen --restore &

xrdb -load .Xresources

polybar main &
