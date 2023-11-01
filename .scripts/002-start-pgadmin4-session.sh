#!/bin/zsh
export SUDO_ASKPASS=$HOME/.scripts/common/askpass-rofi.sh
sudo -A systemctl start postgresql.service
source ~/.venv/pgadmin4/bin/activate
nohup pgadmin4 >&/dev/null &
sleep 5
xdg-open "http://127.0.0.1:5050"

