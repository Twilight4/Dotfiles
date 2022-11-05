#!/bin/sh

# VBox
VBoxClient --clipboard &
VBoxClient --seamless &
VBoxClient --checkhostversion &

# Bare Metal
picom --experimental-backends &
nitrogen --restore &
exec --no-startup -id dunst &
udiskie &
bash ~/.config/polybar/launch.sh

#Network
#nm-applet &

# Bluetooth
#blueman-applet &
