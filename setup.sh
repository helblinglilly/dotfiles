if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Linux"
    sudo apt update
    sudo apt upgrade -y
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "mac setup"

    echo "=== Decreating Dock auto-hide animation time ==="
    defaults write com.apple.dock autohide-time-modifier -float 0.2 && killAll Dock

    echo "=== Configuring .zshrc file ==="
    cat >> "$HOME/.zshrc" <<'EOF'
find "$HOME/.utility" -type f -name '*.zsh' -print0 |
while IFS= read -r -d '' file; do
    . "$file"
done
EOF
    echo "=== Copying ~/.gitconfig ==="
    cp -f ~/.utility/dotfiles/git/.gitconfig ~/.gitconfig

    echo "=== Migrating Zed settings ===="
    chmod +x ~/.utility/dotfiles/zed/setup.sh
    ./zed/setup.sh

    echo "=== Disabling last login message ==="
    touch "$HOME/.hushlogin"
fi
