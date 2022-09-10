export PATH=~/bin:$PATH
export LANG=en_US.UTF-8
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

antigen theme shashankmehta/dotfiles thesetup/zsh/.oh-my-zsh/custom/themes/gitster.zsh-theme

antigen apply

. ~/.zsh_aliases

echo ""
fortune 

LOCALZSHRC=~/.zshrc-$(scutil --get LocalHostName)
if test -f "$LOCALZSHRC"; then
	. "$LOCALZSHRC"
fi
