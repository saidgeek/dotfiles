export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
zplug zsh-users/zsh-autosuggestions
zplug zsh-users/zsh-completions
zplug zsh-users/zsh-syntax-highlighting

# this config is verbose temporaly, because is development
# TODO: remove `--verbose` then is stable
zplug load

autoload -U compinit && compinit

export KEYTIMEOUT=1

bindkey -v

setopt AUTO_MENU
setopt ALWAYS_TO_END
setopt COMPLETE_IN_WORD
setopt FLOW_CONTROL
setopt MENU_COMPLETE

zstyle ':completion:*:*:*:*:*' menu select
