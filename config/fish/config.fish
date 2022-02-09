# config fundle
source (dirname (status --current-filename))/plugins.fish

set fish_greeting ""

set -gx TERM xterm-256color

# alias
alias g git
alias gs "g status"
alias ga "g add"
alias gaa "ga ."
alias gc "g commit"
alias gca "gc --amend"
alias gr "g rebase"
alias gri "gr -i"
alias gl "g log --oneline"

command -qv nvim && alias v nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH $HOME/.cargo/bin $PATH
set -gx JQ_LIB_DIR /usr/local/lib

if type -q exa
  alias ll "exa -a --group-directories-first -l --icons --color=always --git"
  alias l "ll --no-filesize --no-permissions --no-user --no-time"
end

# nvm config
set -gx NVM_DIR ~/.nvm
set -gx nvm_prefix $NVM_DIR

function __check_nvm --on-variable PWD --description "check nvm use"
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  end
end

# source (pyenv init --path | psub)
# source (pyenv virtualenv-init - | psub)

