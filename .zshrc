# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# options
unsetopt menu_complete
unsetopt flowcontrol

setopt prompt_subst
setopt always_to_end
setopt append_history
setopt auto_menu
setopt complete_in_word
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

autoload -U compinit 
compinit

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

PS1='[%n:%~]$ '
export PATH=~/bin:$PATH
export SCRIPTS_DIR=$HOME/.scripts

alias xvenv='source xvenv'

