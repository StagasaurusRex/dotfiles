export EDITOR="/usr/local/bin/nvim"
export PATH=~/bin:$PATH
export LANG=en_US.UTF-8
export ZSH_TMUX_AUTOSTART=true
export COMPLETION_WAITING_DOTS="false"
export ZSH="/Users/staggs/.oh-my-zsh"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH=$PATH:$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export NODE_ARGS='--max_old_space_size=2048'

source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle git-extras
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle osx
antigen bundle brew
antigen bundle vagrant
antigen bundle common-aliases
antigen bundle tmux
antigen bundle ansible
antigen bundle marzocchi/zsh-notify
antigen bundle wd

antigen theme shashankmehta/dotfiles thesetup/zsh/.oh-my-zsh/custom/themes/gitster.zsh-theme

antigen apply


. ~/.zsh_aliases

echo ""
fortune -as 

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
