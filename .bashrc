export TERM="xterm-256color"

[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"

alias ls='eza --color=always --group-directories-first'
alias la='eza -a --color=always --group-directories-first'
alias ll='eza -al --color=always --group-directories-first'
alias lt='eza -aT --color=always --group-directories-first'
