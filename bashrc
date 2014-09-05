#!/bin/bash
# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#user specific aliases and functions
alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias ll='ls -l --color=auto'
alias l.='ls -al --color=auto'
alias ss="scrot -s scrot_%Y-%m-%d_%H%M%S.png"
#alias subl="subl3"
export EDITOR="subl3 -w"
#export PATH=$PATH:$(ruby -rubygems -e "puts Gem.user_dir")/bin
export PATH=".local/bin:"$PATH

white="\[\e[0;37m\]"
bwhite="\[\e[1;37m\]"
gray="\[\e[0;30m\]"
bgray="\[\e[1;30m\]"
cyan="\[\e[0;36m\]"
bcyan="\[\e[1;36m\]"
green="\[\e[0;32m\]"
bgreen="\[\e[1;32m\]"
blue="\[\e[0;34m\]"
bblue="\[\e[1;34m\]"
red="\[\e[0;31m\]"
bred="\[\e[1;31m\]"
purple="\[\e[0;35m\]"
bpurple="\[\e[1;35m\]"
no_colour="\[\e[0m\]"

awesome_colour="\[\e[0;36;40m\]"

face=\
"\`if [ \$? = 0 ]; then \
	echo -e '$bcyan^_^'; else \
	echo -e '$bred>_<'; \
fi\`$no_colour"

export PS1="$bpurple[$awesome_colour\u$bpurple@$awesome_colour\h$no_colour $face $bblue\W$bpurple]\$$no_colour "
#export PS1="$awesome_colour\$$no_colour "
export PS2="$awesome_colour>$no_colour "
export PS3="$awesome_colour>>$no_colour "
export PS4="$awesome_colour>>>$no_colour "

#source encrypted partition handling functions
. ~/p/crypt/crypt.sh
