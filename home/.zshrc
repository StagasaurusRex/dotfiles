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

eval "$(starship init zsh)"

antigen apply

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

[ -d /Volumes/Symplany/atlas-app/ops/docker/dev/bin ] && PATH="/Volumes/Symplany/atlas-app/ops/docker/dev/bin:$PATH" #Symplany Managed
