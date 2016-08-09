#!/bin/bash
# .bashrc

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# set tab width
#tabs 1$(for i in {0..39}; do echo ",+2"; done)

# aliases and functions
alias ls="ls --color=auto"
alias la="ls -a --color=auto"
alias ll="ls -l --color=auto"
alias l.="ls -al --color=auto"
alias ss="scrot -s scrot_%Y-%m-%d_%H%M%S.png"
alias R="R --no-save -q"
export EDITOR="subl3 -w"

# add to path
export PATH=$PATH":~/.local/bin"
export PATH=$PATH":$(ruby -rubygems -e "puts Gem.user_dir")/bin"
export PATH=$PATH":~/.cabal/bin"

# set ld library path for rustc
LD_LIBRARY_PATH="/usr/local/lib:/usr/lib"
export LD_LIBRARY_PATH

# add bash completions for sudo
complete -cf sudo

# bspwm panel thingy
export PANEL_FIFO="/tmp/panel-fifo"

# android development
export ANDROID_HOME=/opt/android-sdk

# colours :D
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

# set up prompts
# useful char backups: λ ➜ 
prompt-a(){
	export PS1="$bpurple[$awesome_colour\u$bpurple@$awesome_colour\h$no_colour $face $bblue\W$bpurple]\$$no_colour "
	#export PS1="$awesome_colour\$$no_colour "
	export PS2="$awesome_colour>$no_colour "
	export PS3="$awesome_colour>>$no_colour "
	export PS4="$awesome_colour>>>$no_colour "
}
prompt-b(){
	export PS1="$bpurple[$awesome_colour\u$bpurple@$awesome_colour\h$no_colour $face $bblue\W$bpurple]λ$no_colour "
	#export PS1="$awesome_colour\$$no_colour "
	export PS2="$awesome_colour>$no_colour "
	export PS3="$awesome_colour>>$no_colour "
	export PS4="$awesome_colour>>>$no_colour "
}
prompt-c(){
	export PS1="$bpurple\$$no_colour "
	#export PS1="$awesome_colour\$$no_colour "
	export PS2="$awesome_colour>$no_colour "
	export PS3="$awesome_colour>>$no_colour "
	export PS4="$awesome_colour>>>$no_colour "
}
prompt-d(){
	export PS1="$bpurpleλ$no_colour "
	#export PS1="$awesome_colour\$$no_colour "
	export PS2="$awesome_colour>$no_colour "
	export PS3="$awesome_colour>>$no_colour "
	export PS4="$awesome_colour>>>$no_colour "
}
# enable prompt a
prompt-b

# source encrypted partition handling functions
[[ -f ~/p/crypt.sh/crypt.sh ]] &&
	source ~/p/crypt.sh/crypt.sh

# apexctl stuff
apex(){
	xmodmap ~/.Xmodmap
	apexctl-profile
	echo "Apex enabled"
}

# git push-all shortcut
git-push-all(){
	for remote in $(git remote | grep 'all\|origin\|official'); do
		echo "Pushing to remote $remote"
		git push $remote
	done
}

# ssh agent stuff
#eval $(ssh-agent)
#export SSH_AGENT_PID=$(pgrep -ou $USER ssh-agent)
#export SSH_AUTH_SOCK="$(find -L /tmp -type s -user $USER -name 'agent.*' 2>/dev/null | head -1)"

# pgp stuff
# start gnupg ( if it isn't already running )
gpgagent-start(){
	eval $(gpg-agent --daemon --write-env-file "${HOME}/.gnupg/agent-info")
}
gpgagent-stop(){
	killall gpg-agent
}
gpgagent-reload(){
	echo RELOADAGENT | gpg-connect-agent
}
if [[ -e "${HOME}.gnupg/S.gpg-agent" ]]; then
	source "${HOME}/.gnupg/agent-info"
	export GPG_AGENT_INFO
fi
export PINENTRY_USER_DATA="USE_CURSES=1"
export GNUPGHOME="~/keys/gpg/"

# fix little gnome terminal bug
#source /etc/profile.d/vte.sh
