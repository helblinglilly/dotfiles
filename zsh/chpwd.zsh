# Automatically run `nvm use` when entering a directory with .nvmrc
autoload -U add-zsh-hook

load-nvmrc() {
  if ! command -v nvm &>/dev/null; then
    return
  fi

  local nvmrc_path="$(nvm_find_nvmrc)"
  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
# Note: load-nvmrc is intentionally NOT called at startup here.
# NVM is lazy-loaded (see nvm.zsh), so calling it at startup would
# eagerly initialise NVM and slow down shell startup. It will be
# triggered naturally the first time you cd into a directory.
