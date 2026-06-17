_load_nvm() {
  command -v nvm >/dev/null 2>&1 && return 0

  local nvm_sh=""

  if [ -n "$NVM_DIR" ] && [ -s "$NVM_DIR/nvm.sh" ]; then
    nvm_sh="$NVM_DIR/nvm.sh"
  elif [ -s "/opt/homebrew/opt/nvm/nvm.sh" ]; then
    nvm_sh="/opt/homebrew/opt/nvm/nvm.sh"
  elif [ -s "/usr/local/opt/nvm/nvm.sh" ]; then
    nvm_sh="/usr/local/opt/nvm/nvm.sh"
  fi

  [ -n "$nvm_sh" ] || return 1

  . "$nvm_sh"
}

load-nvmrc() {
  [ -f ".nvmrc" ] || return 0

  local nvmrc_version current_version nvmrc_clean current_clean

  nvmrc_version="$(cat .nvmrc)"
  current_version="$(node --version 2>/dev/null)"

  # Strip leading 'v' from both for comparison
  nvmrc_clean="${nvmrc_version#v}"
  current_clean="${current_version#v}"

  if [ "$nvmrc_clean" != "$current_clean" ]; then
    _load_nvm || return 0
    command -v nvm >/dev/null 2>&1 || return 0
    nvm use
  fi
}

autoload -Uz add-zsh-hook
add-zsh-hook chpwd load-nvmrc
load-nvmrc
