#!/bin/zsh
sleep 1
fname=ss_$(date -d "today" +"%Y_%m_%d_%H_%M_%S").png
import ~/Pictures/$fname
xclip -selection clipboard -t image/png -i ~/Pictures/$fname

