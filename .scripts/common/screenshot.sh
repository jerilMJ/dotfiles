#!/bin/zsh
lockfile=/tmp/screenshot_lock
if [ -e $lockfile ]; then
    echo "Another instance is already running."
else
    touch $lockfile
    fname=ss_$(date -d "today" +"%Y_%m_%d_%H_%M_%S").png
    sleep 1
    import ~/Pictures/$fname
    xclip -selection clipboard -t image/png -i ~/Pictures/$fname
    rm $lockfile
fi

