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

if type -q exa
  alias ll "exa -a --group-directories-first -l --icons --color=always --git"
  alias l "ll --no-filesize --no-permissions --no-user --no-time"
end

if not functions -q fundle; 
  eval (curl -sfL https://git.io/fundle-install);
  command "fundle install"
else
  source ~/.config/fish/plugins.fish
end

