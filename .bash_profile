export NVM_DIR="/Users/eben/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# macports path mod
export PATH=/usr/local/sbin:/usr/local/share/npm/bin:/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
#export PATH=~/Library/Python/2.7/bin:$PATH
export PATH=/usr/local/opt/python@3.9/libexec/bin:$PATH
export PATH=/usr/local/opt/mongodb-community@4.2/bin:$PATH
export BASH_SILENCE_DEPRECATION_WARNING=1
export DEBUG_PRINT_LIMIT=1000

export CLICOLOR=1

export LDFLAGS="-L/usr/local/opt/libffi/lib"
export CPPFLAGS="-I/usr/local/opt/libffi/include"

# start credit key config
export CREDITKEY_MDB_HOST_1="127.0.0.1:27017"
export CREDITKEY_MDB_HOST_2="127.0.0.1:27017"
#export CREDITKEY_PROD_MDB_HOST_${REACT_APP_BASE_URI}/dashboard/borrower1="db-west-1.creditkey.tech"
#export CREDITKEY_PROD_MDB_HOST_2="db-west-2.creditkey.tech"
#export CREDITKEY_MDB_SSL_CA_CERT=$HOME/ssl/ck-root.pem
#export CREDITKEY_MDB_SSL_CERT=$HOME/ssl/eben.creditkey.tech.pem
#export CREDITKEY_MDB_SSL_KEY=$HOME/ssl/eben.creditkey.tech.key
#export CREDITKEY_MDB_USER="CN=eben.creditkey.tech,OU=CreditKeyClient,O=CreditKey,L=Los Angeles,ST=CA,C=US"
export CREDITKEY_MDB_USER="east-1-web"
export CREDITKEY_MDB_PASSWORD="6xO1wZSCHBINpkXJ"
export CREDITKEY_MDB_ENDPOINT="ck-production.kuk0n.mongodb.net"
export CREDITKEY_MDB_COLLECTION="creditkey-production"
export CREDITKEY_SYMMETRIC_ENCRYPTION_PATH="/Users/eben/creditkey/developer-containers/apps/ck-web/local-production/symmetric-encryption"
export CREDITKEY_ENCRYPTION_PASSWORD="cr3d1tk3y1sgr4nd!"
export CREDITKEY_ENCRYPTION_SALT="E1F53135E559C253" # random 64 bit string
export CREDITKEY_DWOLLA_WEBHOOK_POSTBACK_HOST="https://3287b9ad.ngrok.io"
export CREDITKEY_TEST_EMAIL="egoodman@creditkey.com"
export CREDITKEY_CLEAR_X509_CERT="/Users/eben/creditkey/Clear/CREDKEYBETA.crt"
export CREDITKEY_CLEAR_X509_KEY="/Users/eben/creditkey/Clear/CREDKEYBETA.key"
export DEVISE_JWT_SECRET_KEY="f6c767cc4282d2f4b7de98cb2cd02a52fb5b654aeb9f271872bef13f1d5b9c1a9e8869f625cd73529213381d9e5cfa6c941d4b5c97acfb2d64175cab35eda3c5"
#export CHECKOUT_UI_VERSION="rails"
export CHECKOUT_UI_VERSION="react"
export FONTAWESOME_NPM_AUTH_TOKEN="4965D490-7A5D-4C83-9FEC-FCCBAE1D879E"
export CHECKOUT_URL="http://ebenairm2.local:3001"
export APPLY_URL="http://apply.ebenairm2.local:3001"
export MODELSHOP_VERSION="v2"

export AWS_DEFAULT_REGION="us-east-1"
export CK_REMOTE_USER=ec2-user
export ZENDESK_ENVIRONMENT="staging"

export TPS_DATABASE_URL="postgresql://ck_tps_owner:Cr3d1tk3y!@!@localhost:5432/ck_tps?schema=tps"
export TPS_TEST_DATABASE_URL="postgresql://ck_tps_owner:TestTestTest@localhost:5433/ck_tps?schema=tps"

export PGSQL_USER="ck-web"
export PGSQL_PASSWORD="s@FaUAx2^a0g@Nl6"
export PGSQL_SCHEMA="moresql"

#export AUTH0_DOMAIN="dev-hbu9uxg5.us.auth0.com"
#export AUTH0_CLIENT_ID="bRsfW2JZq3Ay8gmXpKO4xMKR7Y46XmXX"
#export AUTH0_CLIENT_SECRET="TD0Cvquy7CW8aqIN-lTKnLmTH2gjlrsY-tL2zM2pH-zrws4nr9QWELVOejZmqqRe"
#export AUTH0_API_TOKEN="eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InNTQ29kSVBFLU1JaEhqWno2dTRySCJ9.eyJpc3MiOiJodHRwczovL2Rldi1oYnU5dXhnNS51cy5hdXRoMC5jb20vIiwic3ViIjoiVXZKdDVQc3gzWndEQ3dKMmU3UHViRzZkOGJ2UjlzNnZAY2xpZW50cyIsImF1ZCI6Imh0dHBzOi8vZGV2LWhidTl1eGc1LnVzLmF1dGgwLmNvbS9hcGkvdjIvIiwiaWF0IjoxNjQ0NTk0MDMxLCJleHAiOjE2NDQ2ODA0MzEsImF6cCI6IlV2SnQ1UHN4M1p3REN3SjJlN1B1Ykc2ZDhidlI5czZ2Iiwic2NvcGUiOiJyZWFkOmNsaWVudF9ncmFudHMgY3JlYXRlOmNsaWVudF9ncmFudHMgZGVsZXRlOmNsaWVudF9ncmFudHMgdXBkYXRlOmNsaWVudF9ncmFudHMgcmVhZDp1c2VycyB1cGRhdGU6dXNlcnMgZGVsZXRlOnVzZXJzIGNyZWF0ZTp1c2VycyByZWFkOnVzZXJzX2FwcF9tZXRhZGF0YSB1cGRhdGU6dXNlcnNfYXBwX21ldGFkYXRhIGRlbGV0ZTp1c2Vyc19hcHBfbWV0YWRhdGEgY3JlYXRlOnVzZXJzX2FwcF9tZXRhZGF0YSByZWFkOnVzZXJfY3VzdG9tX2Jsb2NrcyBjcmVhdGU6dXNlcl9jdXN0b21fYmxvY2tzIGRlbGV0ZTp1c2VyX2N1c3RvbV9ibG9ja3MgY3JlYXRlOnVzZXJfdGlja2V0cyByZWFkOmNsaWVudHMgdXBkYXRlOmNsaWVudHMgZGVsZXRlOmNsaWVudHMgY3JlYXRlOmNsaWVudHMgcmVhZDpjbGllbnRfa2V5cyB1cGRhdGU6Y2xpZW50X2tleXMgZGVsZXRlOmNsaWVudF9rZXlzIGNyZWF0ZTpjbGllbnRfa2V5cyByZWFkOmNvbm5lY3Rpb25zIHVwZGF0ZTpjb25uZWN0aW9ucyBkZWxldGU6Y29ubmVjdGlvbnMgY3JlYXRlOmNvbm5lY3Rpb25zIHJlYWQ6cmVzb3VyY2Vfc2VydmVycyB1cGRhdGU6cmVzb3VyY2Vfc2VydmVycyBkZWxldGU6cmVzb3VyY2Vfc2VydmVycyBjcmVhdGU6cmVzb3VyY2Vfc2VydmVycyByZWFkOmRldmljZV9jcmVkZW50aWFscyB1cGRhdGU6ZGV2aWNlX2NyZWRlbnRpYWxzIGRlbGV0ZTpkZXZpY2VfY3JlZGVudGlhbHMgY3JlYXRlOmRldmljZV9jcmVkZW50aWFscyByZWFkOnJ1bGVzIHVwZGF0ZTpydWxlcyBkZWxldGU6cnVsZXMgY3JlYXRlOnJ1bGVzIHJlYWQ6cnVsZXNfY29uZmlncyB1cGRhdGU6cnVsZXNfY29uZmlncyBkZWxldGU6cnVsZXNfY29uZmlncyByZWFkOmhvb2tzIHVwZGF0ZTpob29rcyBkZWxldGU6aG9va3MgY3JlYXRlOmhvb2tzIHJlYWQ6YWN0aW9ucyB1cGRhdGU6YWN0aW9ucyBkZWxldGU6YWN0aW9ucyBjcmVhdGU6YWN0aW9ucyByZWFkOmVtYWlsX3Byb3ZpZGVyIHVwZGF0ZTplbWFpbF9wcm92aWRlciBkZWxldGU6ZW1haWxfcHJvdmlkZXIgY3JlYXRlOmVtYWlsX3Byb3ZpZGVyIGJsYWNrbGlzdDp0b2tlbnMgcmVhZDpzdGF0cyByZWFkOmluc2lnaHRzIHJlYWQ6dGVuYW50X3NldHRpbmdzIHVwZGF0ZTp0ZW5hbnRfc2V0dGluZ3MgcmVhZDpsb2dzIHJlYWQ6bG9nc191c2VycyByZWFkOnNoaWVsZHMgY3JlYXRlOnNoaWVsZHMgdXBkYXRlOnNoaWVsZHMgZGVsZXRlOnNoaWVsZHMgcmVhZDphbm9tYWx5X2Jsb2NrcyBkZWxldGU6YW5vbWFseV9ibG9ja3MgdXBkYXRlOnRyaWdnZXJzIHJlYWQ6dHJpZ2dlcnMgcmVhZDpncmFudHMgZGVsZXRlOmdyYW50cyByZWFkOmd1YXJkaWFuX2ZhY3RvcnMgdXBkYXRlOmd1YXJkaWFuX2ZhY3RvcnMgcmVhZDpndWFyZGlhbl9lbnJvbGxtZW50cyBkZWxldGU6Z3VhcmRpYW5fZW5yb2xsbWVudHMgY3JlYXRlOmd1YXJkaWFuX2Vucm9sbG1lbnRfdGlja2V0cyByZWFkOnVzZXJfaWRwX3Rva2VucyBjcmVhdGU6cGFzc3dvcmRzX2NoZWNraW5nX2pvYiBkZWxldGU6cGFzc3dvcmRzX2NoZWNraW5nX2pvYiByZWFkOmN1c3RvbV9kb21haW5zIGRlbGV0ZTpjdXN0b21fZG9tYWlucyBjcmVhdGU6Y3VzdG9tX2RvbWFpbnMgdXBkYXRlOmN1c3RvbV9kb21haW5zIHJlYWQ6ZW1haWxfdGVtcGxhdGVzIGNyZWF0ZTplbWFpbF90ZW1wbGF0ZXMgdXBkYXRlOmVtYWlsX3RlbXBsYXRlcyByZWFkOm1mYV9wb2xpY2llcyB1cGRhdGU6bWZhX3BvbGljaWVzIHJlYWQ6cm9sZXMgY3JlYXRlOnJvbGVzIGRlbGV0ZTpyb2xlcyB1cGRhdGU6cm9sZXMgcmVhZDpwcm9tcHRzIHVwZGF0ZTpwcm9tcHRzIHJlYWQ6YnJhbmRpbmcgdXBkYXRlOmJyYW5kaW5nIGRlbGV0ZTpicmFuZGluZyByZWFkOmxvZ19zdHJlYW1zIGNyZWF0ZTpsb2dfc3RyZWFtcyBkZWxldGU6bG9nX3N0cmVhbXMgdXBkYXRlOmxvZ19zdHJlYW1zIGNyZWF0ZTpzaWduaW5nX2tleXMgcmVhZDpzaWduaW5nX2tleXMgdXBkYXRlOnNpZ25pbmdfa2V5cyByZWFkOmxpbWl0cyB1cGRhdGU6bGltaXRzIGNyZWF0ZTpyb2xlX21lbWJlcnMgcmVhZDpyb2xlX21lbWJlcnMgZGVsZXRlOnJvbGVfbWVtYmVycyByZWFkOmVudGl0bGVtZW50cyByZWFkOmF0dGFja19wcm90ZWN0aW9uIHVwZGF0ZTphdHRhY2tfcHJvdGVjdGlvbiByZWFkOm9yZ2FuaXphdGlvbnMgdXBkYXRlOm9yZ2FuaXphdGlvbnMgY3JlYXRlOm9yZ2FuaXphdGlvbnMgZGVsZXRlOm9yZ2FuaXphdGlvbnMgY3JlYXRlOm9yZ2FuaXphdGlvbl9tZW1iZXJzIHJlYWQ6b3JnYW5pemF0aW9uX21lbWJlcnMgZGVsZXRlOm9yZ2FuaXphdGlvbl9tZW1iZXJzIGNyZWF0ZTpvcmdhbml6YXRpb25fY29ubmVjdGlvbnMgcmVhZDpvcmdhbml6YXRpb25fY29ubmVjdGlvbnMgdXBkYXRlOm9yZ2FuaXphdGlvbl9jb25uZWN0aW9ucyBkZWxldGU6b3JnYW5pemF0aW9uX2Nvbm5lY3Rpb25zIGNyZWF0ZTpvcmdhbml6YXRpb25fbWVtYmVyX3JvbGVzIHJlYWQ6b3JnYW5pemF0aW9uX21lbWJlcl9yb2xlcyBkZWxldGU6b3JnYW5pemF0aW9uX21lbWJlcl9yb2xlcyBjcmVhdGU6b3JnYW5pemF0aW9uX2ludml0YXRpb25zIHJlYWQ6b3JnYW5pemF0aW9uX2ludml0YXRpb25zIGRlbGV0ZTpvcmdhbml6YXRpb25faW52aXRhdGlvbnMiLCJndHkiOiJjbGllbnQtY3JlZGVudGlhbHMifQ.Pyku5kf9ZhZogju1ll1upbXD_6fX_mRC4AFLkHPpc1bCuiVCOU5UquehPjB2wwFunhUwLASvT2n6_HeQn_eaEics5ZZRDl0kwc7ybbyAuvM2mQ-y2EcEvfN7qitRj7zZbquXkkSjVFOAQYd-fFxqtDESYuHitvs9TIrWRhp6tYEsXGqeIus3t80JiAY3D8z-_oVOHzzJGBqlrNq_bcynoO30qzBYzJ8V-wTi2sfkn3elAKOsuMdy0THRjA7accfkrhdaf6RkRioATK5I14TNub_Th1bTcMCXsHW3LWknMi3pTmoCuhbOyFE-NYrCMx4HvCZmjxYKBoD37X9rqnoZpg"

ck-prod() {
  AWS_PROFILE=creditkey ~/creditkey/ck-ecosystem/apps/ck-web/deploy/ck-ecs.sh remote production
  #ssh $CK_REMOTE_USER@$(aws ec2 describe-instances --region $AWS_DEFAULT_REGION --query 'Reservations[*].Instances[*][PrivateIpAddress]' --filters Name=tag:Name,Values=CK-WEB-PROD-ASG Name=instance-state-name,Values=running --profile creditkey --output text | head -n 1)
}

ck-staging() {
  AWS_PROFILE=creditkey ~/creditkey/ck-ecosystem/apps/ck-web/deploy/ck-ecs.sh remote staging
  #ssh $CK_REMOTE_USER@$(aws ec2 describe-instances --region $AWS_DEFAULT_REGION --query 'Reservations[*].Instances[*][PrivateIpAddress]' --filters Name=tag:Name,Values=CK-WEB-STG-ASG Name=instance-state-name,Values=running --profile creditkey --output text | head -n 1)
}
# end credit key config

# start cci config
export WITHINGS_KEY='c8b372b60c1846951f82dbc4bd9cb957048b4ddb65b4019e8bf94e7cb8'
export WITHINGS_SECRET='550e2185376e2688c6b6f9028d3933487ce467129d87f37efbd43b6c9642f'
export FITBIT_KEY='227WQ8'
export FITBIT_SECRET='8ab895b439536e58bedf337bd6469997'
# end cci config

# Use bash-completion, if available
if [ -f $(brew --prefix)/etc/bash_completion ]; then
   . $(brew --prefix)/etc/bash_completion
fi

#[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    #. /usr/share/bash-completion/bash_completion

# Use git-completion script if available
if [ -f ~/dotfiles/.git-completion.bash ]; then
    . ~/dotfiles/.git-completion.bash
fi

# put this in your .bash_profile
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi

#source dotfiles/liquidprompt/liquidprompt

# powerline
#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /Users/eben/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh
eval "$(starship init bash)"

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
__git_complete gbd _git_branch

alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'

alias gco='git checkout'
__git_complete gco _git_checkout

alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gp='git pull'
alias gr='git rebase'
alias gl='git log'

alias gpf='git push -f'
__git_complete gpf _git_push

alias gpu='git push -u origin'
__git_complete gpu _git_push

alias gf='git fetch'
__git_complete gf _git_fetch

alias grh='git reset --hard'
__git_complete grh _git_reset

alias grho='git reset --hard origin/`cb`'

alias cb='git rev-parse --abbrev-ref HEAD'

alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

export PATH="/usr/local/opt/mongodb@3.6/bin:$PATH"

# BEGIN SNIPPET: Magento Cloud CLI configuration
#HOME=${HOME:-'/Users/eben'}
#export PATH="$HOME/"'.magento-cloud/bin':"$PATH"
#if [ -f "$HOME/"'.magento-cloud/shell-config.rc' ]; then . "$HOME/"'.magento-cloud/shell-config.rc'; fi # END SNIPPET

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
. /usr/local/opt/asdf/libexec/asdf.sh
#. $HOME/.asdf/asdf.sh
#. $HOME/.asdf/completions/asdf.bash
