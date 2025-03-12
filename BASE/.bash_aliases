alias ll='ls -Alh'
alias la='ls -A'
alias grep='grep --color=auto'
alias rm='rm -v'
alias cp='cp -v'
alias mv='mv -v'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias mc='. /usr/share/mc/bin/mc-wrapper.sh'

alias su="su -"
alias py="python3"
alias gst="git status"

alias jq="jq --color-output"
alias less="less -RSQ"
alias man="man -P 'less -Q'"
alias clean="rm *~ .*~"
alias iex='iex -S mix'

function p {
  mix p "$1" && cd "$1"
}

