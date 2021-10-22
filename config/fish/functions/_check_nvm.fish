function _check_nvm --on-variable PWD --description "check nvm use"
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  end
end
