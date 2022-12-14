for file in /Users/joel/.utility/*.zsh; do
. $file
done

for file in /Users/joel/.utility/shortcuts/*.zsh; do
. $file
done
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
