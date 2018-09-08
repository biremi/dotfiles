export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

#Aliases
alias ll="ls -laG"
alias e="mvim"

alias gs="git status"
alias пы="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias gl="git pull"
alias go="git checkout"
alias ga="git add"
alias gb="git branch"
alias gc='git commit'
alias gcm='git commit -m'
alias gpuh="git push origin head"
alias gpuf="git push origin head -f"
alias game='git commit --amend'

alias be="bundle exec"
alias ber="bundle exec rspec"
alias ztest="zeus test"
alias jtest="TZ='US/Pacific' spring rake spec:javascript"
alias jber="JS_DRIVER=selenium bundle exec rspec"
alias pgb="psql -d benchdex_development"
alias pgbb="pgcli -d benchdex_development"
alias rtags="ctags -R --exclude=.git --exclude=log *"

#Redis
alias redisstart='sudo launchctl start io.redis.redis-server'
alias redisstop='sudo launchctl stop io.redis.redis-server'

#enables color in the terminal bash shell export
CLICOLOR=1
#sets up the color scheme for list export
LSCOLORS=gxfxcxdxbxegedabagacad

## PROMPT

#sets up the prompt color (currently a green similar to linux terminal)
#export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '

RED="\033[0;31m"
YELLOW="\033[0;33m"
GREEN="\033[0;32m"
GRAY="\033[1;30m"
LIGHT_GRAY="\033[0;37m"
CYAN="\033[0;36m"
LIGHT_CYAN="\033[1;36m"
NO_COLOUR="\033[0m"

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=true
GIT_PS1_SHOWCOLORHINTS=true

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $YELLOW
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $GREEN
  else
    echo -e $GRAY
  fi
}

PS1="\[$LIGHT_GRAY\]\u@\h\[$NO_COLOUR\]:\[$LIGHT_CYAN\]\w" # basename of pwd
PS1+="\[\$(git_color)\]"                                   # colors git status
PS1+="\$(__git_ps1 ' (%s)')"                               # prints current branch
PS1+="\[$NO_COLOUR\]\$ "                                   # '#' for root, else '$'
export PS1

export EDITOR='mvim -f'
#source ~/Work/brightbytes/brightbytes/.env
#source ~/Work/brightbytes/pipeline/.env
#source ~/Work/brightbytes/common-ui/.env
#source ~/Work/brightbytes/fin-public/.env
#source ~/Work/brightbytes/fin-api/.env
#source ~/.oh-my-git/prompt.sh

#bash completions
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi
