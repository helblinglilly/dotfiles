load-nvmrc() {
  if [ -f ".nvmrc" ]; then
    local nvmrc_version=$(cat .nvmrc)
    local current_version=$(node --version 2>/dev/null)

    # Strip leading 'v' from both for comparison
    local nvmrc_clean="${nvmrc_version#v}"
    local current_clean="${current_version#v}"

    if [ "$nvmrc_clean" != "$current_clean" ]; then
      [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
      nvm use
    fi
  fi
}

autoload -Uz add-zsh-hook
load-nvmrc
