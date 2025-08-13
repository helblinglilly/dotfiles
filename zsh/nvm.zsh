autoload -U add-zsh-hook

nvm_auto_use() {
  if [ -f .nvmrc ]; then
    nvm use --silent >/dev/null
  fi
}
