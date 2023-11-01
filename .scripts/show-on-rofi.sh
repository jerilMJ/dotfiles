#!/bin/zsh
SCRIPTS_DIR="$HOME/.scripts"
SCRIPTS=$(find "$SCRIPTS_DIR" -type f -maxdepth 1 -executable \
	-not -name $(basename "$0") | sort)
SCRIPT=$(echo "$SCRIPTS" | rofi -dmenu -p "Select a script")

if [ -n "$SCRIPT" ]; then
	"$SCRIPT"
fi

