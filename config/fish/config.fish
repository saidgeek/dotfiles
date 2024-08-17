if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
fnm env --use-on-cd | source
zoxide init fish | source

# nvim
alias nv="nvim"

# zoxide
alias cd="z"

# exa
alias l="exa -G --icons -a -s=type --colour=always -H -I '.git|node_modules'"
alias lt="l -T -L 1"
alias lt2="l -T -L 2"
alias lt3="l -T -L 3"
alias lt4="l -T -L 4"

# git
alias ga="git add"
alias gaa="git add ."
alias g="git status"
alias gl="git log --oneline"
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gcav="git commit --amend --no-verify"
alias gp="git push"
alias gpp-"git pull"
alias gr="git rebase"
alias gri="git rebase -i"
alias gs="git switch"
alias gsc="git switch"
alias zed="zeditor"
