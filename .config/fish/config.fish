set -U fish_greeting

alias ls="eza --color=always --group-directories-first"
alias la="eza -a --color=always --group-directories-first"
alias ll="eza -al --color=always --group-directories-first"
alias lt="eza -aT --color=always --group-directories-first"

starship init fish | source
