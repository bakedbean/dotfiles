[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# macports path mod
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH="/usr/local/bin:$PATH"

export CLICOLOR=1

function parse_git_branch {
 git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

case "$TERM" in
	xterm*|rxvt*)
	export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: ${PWD/#$HOME/~}\007"';;*);;
esac

# Colors
LightBlue="$(tput bold ; tput setaf 4)"
Cyan="$(tput setaf 6)"
LightRed="$(tput bold ; tput setaf 1)"
NC="$(tput sgr0)" # No Color

Orange=$'\e[0;33m'
Grey=$'\e[00;37;40m'

# User specific aliases and functions
PS1='[\t] \[$Orange\]\u\[$NC\]@\[$LightRed\]\h\[$NC\]$(parse_git_branch)\w]\$ '
#PS1='[\t] \[$Orange\]\u\[$NC\]@\[$LightRed\]\h\[$NC\] \w]\$ '
#PS1="[$(date +%H%M%Z)]\[\033[1;31m\]\[\033[1;36m\][\u\[\033[1;33m\]@\h:\[\033[1;35m\]\w]\[\033[1;37m\]$\[\033[1;37m\]"

#Tell bash to save 5000 commands during a session
export HISTFILESIZE=5000
#Tell bash to save 5000 commands between sessions
export HISTSIZE=5000
#Tell bash to not put duplicate lines in the history
export HISTCONTROL=ignoredups
#Change the default directory color from dark blue to burnt orange
export LS_COLORS='no=00:fi=00:di=00;33:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.sh=01;32:*.csh=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.rpm=01;31:*.cpio=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.png=01;35:*.tif=01;35:'
