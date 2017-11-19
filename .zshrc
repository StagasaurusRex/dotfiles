export ZSH=/Users/staggs/.oh-my-zsh
COMPLETION_WAITING_DOTS="false"
. ~/.secrc

ZSH_THEME="gitster"

plugins=(git osx brew git-extras vagrant common-aliases)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8



alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'

alias wol='cd ~/Developer/workoutloud/WOL-Dev-alpha;'

alias up='vagrant up --provision --provider vmware_fusion'
alias provision='vagrant provision'
alias reload='vagrant reload --provision'

alias fuck="sudo !!"

alias g-="git checkout -"

fortune -as | cowsay