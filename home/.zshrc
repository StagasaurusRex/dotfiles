export ZSH=/Users/staggs/.oh-my-zsh
export EDITOR="/usr/local/bin/nvim"
export PATH=~/bin:$PATH
export LANG=en_US.UTF-8

COMPLETION_WAITING_DOTS="false"
ZSH_THEME="gitster"
plugins=(git osx brew git-extras vagrant common-aliases)

source $ZSH/oh-my-zsh.sh
eval $(thefuck --alias)

. ~/.zsh_aliases

unalias gm
gm() {
  git merge --no-ff "$1"
}

fortune -as 
