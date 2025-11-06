alias l='ls -CF'
alias ll='ls -AlhF'
alias la='ls -A'
alias rm='rm -v'
alias cp='cp -v'
alias mv='mv -v'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'


alias su="su -"
alias py="python3"
alias gst="git status"

alias jq="jq --color-output"
alias less="less -RSQ"
alias man="man -P 'less -Q'"

alias clean="rm *~ .*~"

function autologin {
  drop_in='/etc/systemd/system/getty@tty1.service.d/autologin.conf'
  if [ -n "$1" ] ; then
    mkdir -p "$(dirname ${drop_in})"
    echo '[Service]' >"${drop_in}"
    echo 'ExecStart=' >>"${drop_in}"
    echo 'ExecStart=-/sbin/agetty --noreset --noclear --autologin '"$1"' - ${TERM}' >>"${drop_in}"
    systemctl daemon-reload
  else
    rm -f "${drop_in}"
  fi
}

