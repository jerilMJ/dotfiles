#!/bin/zsh
if [[ $(xrandr | grep "HDMI.* connected") ]]; then
	echo "Loading docked mode.."
	autorandr -l docked
else
	echo "Loading mobile mode.."
	autorandr -l mobile
fi

