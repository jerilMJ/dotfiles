#!/bin/zsh
export SUDO_ASKPASS=$HOME/.scripts/common/askpass-rofi.sh
sudo -A systemctl stop postgresql.service
sudo -A kill -9 $(sudo -A fuser -k -n tcp 5050) >&/dev/null

