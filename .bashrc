#!/bin/bash
HISTSIZE= HISTFILESIZE= # Infinite history.

# EXPORTS
export PS1="\[\033[38;5;161m\]\u@\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;45m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;11m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

# ALIASES
alias ll="ls -la"
alias repos="cd ~/data/repos"
alias python="python3"
alias grep="grep --color=always"
