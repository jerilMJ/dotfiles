#!/bin/zsh

DIR="$HOME/dev/"

do=true
SELECTION=""
while $do || [ ! -z $SELECTION ]; do
    do=false
    SELECTION=""
    DIRS=$(find $DIR -mindepth 1 -maxdepth 1 -type d | sort)
    SELECTION=$(echo $DIRS | rofi -dmenu -i -sorting-method fzf -sort -matching fuzzy -p "[$DIR] Open")
    if [ ! -z $SELECTION ]; then
        check=$(echo $DIRS | grep -w $SELECTION) 
        echo $check
        echo $SELECTION
        if [ ! -z $check ] && [ $check = $SELECTION ]; then
            DIR=$SELECTION
        elif [ $SELECTION = ".." ]; then
            if [ ! $DIR = "$HOME/" ]; then
                lastdir=$(echo ${DIR%"/"} | rev | cut -d"/" -f1 | rev)
                echo lastdir = $lastdir
                DIR=${DIR%"/"}
                DIR=${DIR%"$lastdir"}
                echo $DIR
            else
                DIR="$HOME/"
            fi
        fi
    fi
done

alacritty -e tmux new-session -c $DIR -s $DIR "nvim $DIR; zsh -l"

