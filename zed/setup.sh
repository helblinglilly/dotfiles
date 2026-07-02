#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ZED_CONFIG="$HOME/.config/zed"

if [ -L "$ZED_CONFIG" ]; then
  echo "~/.config/zed is already a symlink, skipping."
elif [ -d "$ZED_CONFIG" ]; then
  echo "Backing up existing ~/.config/zed to ~/.config/zed.bak"
  mv "$ZED_CONFIG" "$ZED_CONFIG.bak"
  ln -s "$SCRIPT_DIR" "$ZED_CONFIG"
  echo "Symlinked ~/.config/zed -> $SCRIPT_DIR"
else
  ln -s "$SCRIPT_DIR" "$ZED_CONFIG"
  echo "Symlinked ~/.config/zed -> $SCRIPT_DIR"
fi
