if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Linux"
    sudo apt update
    sudo apt upgrade -y
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "mac"
    # Change the dock's delay speed when it auto hides
    defaults write com.apple.dock autohide-time-modifier -float 0.15 && killAll Dock
    cat >> "$HOME/.zshrc" <<'EOF'
find "$HOME/.utility" -type f -name '*.zsh' -print0 |
while IFS= read -r -d '' file; do
    . "$file"
done
EOF
fi
