export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="dracula"

plugins=(git)

source $ZSH/oh-my-zsh.sh

set -o vi

# History stuff
HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=$HISTSIZE

# ALIASES
alias ls="ls --color=auto"
alias ll="ls -la"
alias repos="cd ~/data/repos"
alias grep="grep --color=always"
alias c="clear"
alias vim="nvim"

export CLICOLOR=1

export PATH="$PATH:/Users/nil/apps/jdt-language-server-1.9.0-202203031534/bin"

export CARGO_TERM_COLOR="always"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
