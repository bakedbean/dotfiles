[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

export NVM_DIR="/Users/eben/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# macports path mod
export PATH=/usr/local/sbin:/usr/local/share/npm/bin:/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=~/Library/Python/2.7/bin:$PATH

export CLICOLOR=1

# start credit key config
export CREDITKEY_MDB_HOST_1="db-west-1.creditkey.tech"
export CREDITKEY_MDB_HOST_2="db-west-2.creditkey.tech"
export CREDITKEY_MDB_SSL_CA_CERT=$HOME/ssl/ck-root.pem
export CREDITKEY_MDB_SSL_CERT=$HOME/ssl/eben.creditkey.tech.pem
export CREDITKEY_MDB_SSL_KEY=$HOME/ssl/eben.creditkey.tech.pem
export CREDITKEY_MDB_USER="CN=eben.creditkey.tech,OU=CreditKeyClient,O=CreditKey,L=Los Angeles,ST=CA,C=US"
export CREDITKEY_ENCRYPTION_PASSWORD="cr3d1tk3y1sgr4nd!"
export CREDITKEY_ENCRYPTION_SALT="E1F53135E559C253" # random 64 bit string
# end credit key config

# start cci config
export WITHINGS_KEY='c8b372b60c1846951f82dbc4bd9cb957048b4ddb65b4019e8bf94e7cb8'
export WITHINGS_SECRET='550e2185376e2688c6b6f9028d3933487ce467129d87f37efbd43b6c9642f'
export FITBIT_KEY='227WQ8'
export FITBIT_SECRET='8ab895b439536e58bedf337bd6469997'
# end cci config

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# Use git-completion script if available
if [ -f ~/dotfiles/.git-completion.bash ]; then
    . ~/dotfiles/.git-completion.bash
fi

source dotfiles/liquidprompt/liquidprompt
#function parse_git_branch {
 #git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
#}

#case "$TERM" in
	#xterm*|rxvt*)
	#export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: ${PWD/#$HOME/~}\007"';;*);;
#esac

# Colors
LightBlue="$(tput bold ; tput setaf 4)"
Cyan="$(tput setaf 6)"
LightRed="$(tput bold ; tput setaf 1)"
NC="$(tput sgr0)" # No Color

Orange=$'\e[0;33m'
Grey=$'\e[00;37;40m'

# User specific aliases and functions
#PS1='[\t] \[$Orange\]\u\[$NC\]@\[$LightRed\]\h\[$NC\]$(parse_git_branch)\w]\$ '
#PS1='[\t] \[$Orange\]\u\[$NC\]@\[$LightRed\]\h\[$NC\] \w]\$ '
#PS1="[$(date +%H%M%Z)]\[\033[1;31m\]\[\033[1;36m\][\u\[\033[1;33m\]@\h:\[\033[1;35m\]\w]\[\033[1;37m\]$\[\033[1;37m\]"

#Tell bash to save 5000 commands during a session
export HISTFILESIZE=15000
#Tell bash to save 5000 commands between sessions
export HISTSIZE=15000
#Tell bash to not put duplicate lines in the history
export HISTCONTROL=ignoredups
#Change the default directory color from dark blue to burnt orange
export LS_COLORS='no=00:fi=00:di=00;33:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.sh=01;32:*.csh=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.rpm=01;31:*.cpio=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.png=01;35:*.tif=01;35:'

stty -ixon -ixoff
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# aliases
alias ga='git add'
alias gaa='git add .'
alias gb='git branch'
alias gbd='git branch -D'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gp='git pull'
alias gr='git rebase'
alias gl='git log'
