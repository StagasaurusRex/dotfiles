export ZSH=/Users/staggs/.oh-my-zsh

ZSH_THEME="gitster"
. ~/bin/z.sh
plugins=(git osx brew git-extras vagrant common-aliases)

COMPLETION_WAITING_DOTS="false"

source $ZSH/oh-my-zsh.sh
. ~/.secrc

export LANG=en_US.UTF-8

alias wol='cd ~/Developer/workoutloud/WOL-Dev-alpha;'
alias up='vagrant up --provision --provider vmware_fusion'
alias provision='vagrant provision'
alias reload='vagrant reload --provision'
alias fuck="sudo !!"
alias g-="git checkout -"
fortune | cowsay 
