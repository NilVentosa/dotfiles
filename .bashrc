#!/bin/bash
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.

# EXPORTS
export LS_COLORS='di=35;01;04:ex=36'
export BIN=~/.local/bin
export PS1="\[\033[38;5;11m\][\[$(tput sgr0)\]\[\033[38;5;13m\]\u@\h\[$(tput sgr0)\]\[\033[38;5;15m\] \
\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;14m\]\W\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;11m\]] \
\[$(tput sgr0)\]\[\033[38;5;15m\]\\$ \[$(tput sgr0)\]"

# ALIASES
alias ls='ls --color=auto'
alias v='nvim'

# VIM mode for bash
set -o vi
