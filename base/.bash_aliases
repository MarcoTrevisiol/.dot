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

function normalize {
  for i in *
  do
    printf "mv %-40s %-40s\n" "'$i'" "'$(tr -- '-a-z0-9.A-Z!"#$%&()+,:;=?@[]^{}|~ _' '-a-z0-9.a-z!!!!!!!!!!!!!!!!!!!!!\-\-' <<<$i)'"
  done
}

function normalize-single {
    tr -- '-a-z0-9.A-Z!"#$%&()+,:;=?@[]^{}|~ _' '-a-z0-9.a-z!!!!!!!!!!!!!!!!!!!!!\-\-' <<<"$1"
}

function normalize-run {
  for i in *
  do
    mv -i "$i" "$(normalize-single $i)"
  done
  find -type d -exec chmod 755 {} \;
  find -type f -name '*.*' -exec chmod 644 {} \;
}

function archive {
  [[ $# -lt 2 ]] && ( echo "usage: archive type directory_to_archive" >&2 ; exit 1 )
  type=~/archivio/"$1"/
  [[ -n $1 ]] && [[ -d $type ]] || ( echo "invalid type; enter one of\n$(ls ~/archivio)" >&2 ; exit 1 )
  shift
  [[ -d $1 ]] || ( echo "$1 invalid dir to archive" >&2 ; exit 1 )
  object="${1%/}"
  year=$(find "$object" -type f -printf "%T@-%TY-%p\n" | sort -n | tail -1 | cut -d- -f 2)
  cwd="$PWD"
  cd "$object"
  normalize-run
  cd "$cwd"
  mv -vi "$object" "${type}${year}-$(normalize-single ${object##*/})"
}

