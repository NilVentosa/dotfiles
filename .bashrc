#!/bin/bash
HISTSIZE= HISTFILESIZE= # Infinite history.

# EXPORTS
export PS1="🍕 \u@\h \w \\$\[$(tput sgr0)\]"

# ALIASES
alias vim="nvim"

# VIM mode for bash
set -o vi
