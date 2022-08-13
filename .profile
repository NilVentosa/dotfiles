HISTSIZE= HISTFILESIZE= # Infinite history.

set -o vi

# EXPORTS
export PATH=$PATH:/home/nil/.local/bin
export PATH=$PATH:/opt/apache-maven-3.8.6/bin
export PATH=$PATH:/home/nil/.local/share/nvim/lsp_servers/rust
export XDG_CONFIG_HOME=~/.config

export JAVA_HOME=/usr/lib/jvm/java-11-amazon-corretto/
#export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_202/
export M2_HOME=/opt/apache-maven-3.8.6

export PS1="\[\033[38;5;161m\]\u@\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;45m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;11m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

# ALIASES
alias ll="ls -la"
alias repos="cd ~/data/repos"
alias grep="grep --color=always"
alias sql="sqlite3"
alias vim="nvim"
alias c="clear"
alias python="python3"

source ~/.profile_ics2

wmname LG3D
. "$HOME/.cargo/env"
