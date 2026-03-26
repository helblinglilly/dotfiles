# Lazy-load NVM to avoid slowing down shell startup.
# NVM will be initialised the first time nvm, node, npm, npx, or yarn is used.

export NVM_DIR="$HOME/.nvm"

_load_nvm() {
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

nvm() {
  unfunction nvm
  _load_nvm
  nvm "$@"
}

node() {
  unfunction node
  _load_nvm
  node "$@"
}

npm() {
  unfunction npm
  _load_nvm
  npm "$@"
}

npx() {
  unfunction npx
  _load_nvm
  npx "$@"
}

yarn() {
  unfunction yarn
  _load_nvm
  yarn "$@"
}
