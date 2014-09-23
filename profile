#!/bin/bash
# .bash_profile

# source ~/.bashrc
[[ -f ~/.bashrc ]] && source ~/.bashrc

# auto launch x
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec xinit

# apply xmodmap
#if [ -f ~/.xmodmap ]; then
#	xmodmap ~/.xmodmap
#fi

#echo -e "Display: $DISPLAY"
#echo -e "Xdg vtnr: $XDG_VTNR"

