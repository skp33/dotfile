#!/usr/bin/env bash

export SPARK_HOME=/usr/hdp/current/spark2.2-client
export SPARK_MAJOR_VERSION=2.2

alias ll='ls -la --color=always'

alias less='less --RAW-CONTROL-CHARS'
export LS_OPTS='--color=auto'
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33'

alias clear="echo -e '\e[2J\n\n'"


# git shortcuts
alias gs="git status"
alias glg="git lg"
alias gl="git lg"
alias gc="git commit"
alias ga="git add"
alias gco="git checkout"
alias gd="git diff"
alias gr="git reset"
alias grh="git reset HEAD"
alias gpp="git pull && git push"
alias gpddraagp="git pull --rebase && git push"

alias tm="tmux a || tmux"

function timer_start {
  timer=${timer:-$SECONDS}
}

function timer_stop {
  timer_show=$(($SECONDS - $timer))
  unset timer
}

trap 'timer_start' DEBUG

if [ "$PROMPT_COMMAND" == "" ]; then
  PROMPT_COMMAND="timer_stop"
else
  PROMPT_COMMAND="$PROMPT_COMMAND; timer_stop"
fi

DURATION='${timer_show}s '

git_branch () { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1) /'; }
MYJOB='\[\033[38;5;248m\]╔ǁ\[\033[31;01m\]\j'
MYTIME='\[\033[38;5;248m\] ǁ\[\033[34;01m\]$(TZ=":Asia/Kolkata" date +%T)\[\033[38;5;248m\] ǁ'
MYUSER='\[\033[0;32m\]\u\[\033[38;5;248m\]@'
MYHOST='\[\033[02;36m\]\h\[\033[38;5;248m\]:'
MYLOCATION='\[\033[01;34m\]`pwd | sed "s#\(/[^/]\{1,\}/[^/]\{1,\}/[^/]\{1,\}/\).*\(/[^/]\{1,\}/[^/]\{1,\}\)/\{0,1\}#\1_\2#g"` '
MYBRANCH='\[\033[00;33m\]$(git_branch)\n\[\033[38;5;248m\]╚══►{｡^◕‿◕^｡}  \[\[\033[00m\]'
PS1=$MYJOB$MYTIME$MYUSER$MYHOST$MYLOCATION$MYBRANCH
PS2='\[\033[01;36m\]>\[\[\e[00m\]'

# while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-11));echo -e "\e[34m`TZ=":Asia/Kolkata" date +%r`\e[39m";tput rc;done &

cat << "EOF"
#                                                  _ 
#   /_/_       /_/_          _       _/_  ._  _   '_/
#  / //_'/_// / //_/|/|/ /_//_//_/ /_//_/// //_/../  
#        _/              _/                  _/      
EOF
