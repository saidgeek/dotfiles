export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
zplug zsh-users/zsh-autosuggestions
zplug zsh-users/zsh-completions

# this config is verbose temporaly, because is development
# TODO: remove `--verbose` then is stable
zplug load --verbose

autoload -U compinit && compinit

