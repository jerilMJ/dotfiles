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
$SCRIPTS_DIR/001-update-displays.sh

# Set wallpaper
feh --bg-fill ~/Pictures/Wallpapers/dark_souls_firelink.jpg

