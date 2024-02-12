export TERM="xterm-256color"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias ls='eza --color=always --group-directories-first'
alias la='eza -a --color=always --group-directories-first'
alias ll='eza -al --color=always --group-directories-first'
alias lt='eza -aT --color=always --group-directories-first'