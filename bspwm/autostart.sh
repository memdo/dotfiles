sh .config/polybar/launch.sh &
# autokey-gtk &
picom --experimental-backends --backend glx &
numlockx &

xrandr --newmode "1920x1080_75.50"  222.25  1920 2064 2264 2608  1080 1083 1088 1130 -hsync +vsync &
xrandr --addmode --verbose HDMI-A-0 "1920x1080_75.50" &
xrandr --output HDMI-A-0 --mode "1920x1080_75.50" &

autokey-gtk &
spotblock &
