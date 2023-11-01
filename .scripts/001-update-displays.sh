#!/bin/zsh
if [[ $(xrandr | grep "HDMI-1 connected") ]]; then
	echo "Loading docked mode.."
	autorandr -l docked
else
	echo "Loading mobile mode.."
	autorandr -l mobile
fi

