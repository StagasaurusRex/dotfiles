export ZSH=/Users/staggs/.oh-my-zsh
export EDITOR="/usr/local/bin/nvim"
export PATH=~/bin:$PATH

COMPLETION_WAITING_DOTS="false"
. ~/.secrc

ZSH_THEME="gitster"

plugins=(git osx brew git-extras vagrant common-aliases)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

eval $(thefuck --alias)

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'

alias wol='cd ~/Developer/workoutloud/WOL-Dev-alpha;'

alias up='vagrant up --provision --provider vmware_fusion'
alias provision='vagrant provision'
alias reload='vagrant reload --provision'

alias g-="git checkout -"
alias gc="gitmoji -c"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

v() {
  nvim $1
}
unalias gm
gm() {
  git merge --no-ff "$1"
}

fortune -as 
