#!/bin/sh
feh --bg-scale /usr/share/endeavouros/backgrounds/endeavouros-wallpaper.png

# --experimental-backends --vsync should prevent screen tearing on most setups if needed
picom & disown

# Low battery notifier
~/.config/qtile/scripts/check_battery.sh & disown

# Start welcome
# eos-welcome & disown

# start polkit agent from GNOME
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & disown

# My scripts
~/.scripts/001-update-displays.sh & disown

# Set wallpaper
# Delay is added to wait for all screens to be setup by qtile
sleep 1 && ~/.scripts/common/random_wallpaper.sh & disown
