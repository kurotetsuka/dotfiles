#!/bin/bash
# .bash_profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

# ssh agent stuff
#eval $(ssh-agent)
#export SSH_AGENT_PID=$(pgrep -ou $USER ssh-agent)
#export SSH_AUTH_SOCK="$(find -L /tmp -type s -user $USER -name 'agent.*' 2>/dev/null | head -1)"

# auto launch x
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec xinit

# apply xmodmap
#if [ -f ~/.xmodmap ]; then
#	xmodmap ~/.xmodmap
#fi

#echo -e "Display: $DISPLAY"
#echo -e "Xdg vtnr: $XDG_VTNR"

