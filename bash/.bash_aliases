# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -Alh'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias c='clear'
alias last='find . -type f -not -path "\/-.*" -exec ls -lrt {} +'

alias v='nvim'
alias vim='nvim'
alias sv='sudoedit'
alias poweroff='systemctl poweroff'
alias reboot='systemctl reboot'

alias t='tmux'
alias gp='git pull'
alias gs='git status'

