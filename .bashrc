#!/bin/bash
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.
export LS_COLORS='*.c=37:di=36;01;04:ex=31:*.py=32'
# ALIASES
alias ls='ls --color=auto'
export PS1="\[$(tput bold)\]\[$(tput setaf 3)\][\[$(tput setaf 5)\]\u\[$(tput setaf 4)\]@\[$(tput setaf 2)\]\h \[$(tput setaf 14)\]\W\[$(tput setaf 3)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
export BIN=~/.local/bin

alias colors=$BIN/colors
