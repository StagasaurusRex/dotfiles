export PATH=~/bin:$PATH
export LANG=en_US.UTF-8
export EDITOR=$(which nvim)
export ZSH_TMUX_AUTOSTART=true
export COMPLETION_WAITING_DOTS="false"
export ZSH="/Users/staggs/.oh-my-zsh"

arch_name="$(uname -m)"

if [ "${arch_name}" = "arm64" ]; then
    source /opt/homebrew/share/antigen/antigen.zsh
else
    source /usr/local/share/antigen/antigen.zsh
fi

antigen use oh-my-zsh

antigen bundle git
antigen bundle git-extras
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle osx
antigen bundle brew
antigen bundle common-aliases
antigen bundle tmux
antigen bundle ansible
antigen bundle paulirish/git-open
antigen bundle z
antigen bundle "MichaelAquilina/zsh-you-should-use"
antigen bundle docker

antigen apply

eval "$(starship init zsh)"


source ~/.zsh_aliases
eval "$(op completion zsh)"; compdef _op op

echo ""
fortune 

LOCALZSHRC=~/.zshrc-$(scutil --get LocalHostName)
if test -f "$LOCALZSHRC"; then
	source "$LOCALZSHRC"
fi
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

function printc () {
  CMD=$(cut -d " " -f1 <<< $1)
 case $CMD in
   aws-vault)
     print "We in da vault"
     ;;
   *)
     print "We not in da vault :("
     ;;
 esac
}
plugins=(rails git ruby)

# add-zsh-hook preexec printc

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

[ -f /Volumes/Symplany/atlas-app/.symplanyrc-shared ] && source /Volumes/Symplany/atlas-app/.symplanyrc-shared #Symplany Managed

export PATH=$PATH:/Volumes/Symplany/scripts

# Created by `pipx` on 2024-05-16 18:29:59
export PATH="$PATH:/Users/staggs/.local/bin"
