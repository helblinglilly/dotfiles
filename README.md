# dotfiles

Personal terminal setup and tweaks

## General Setup

Create `~/.utility` directory

`cd ~/.utility && git clone https://github.com/helblinglilly/dotfiles`

Edit `~/.zshrc` to load all `.zsh` files in the utility folder:

```sh
for file in $(find ~/.utility -type f -name "*.zsh"); do
  . "$file"
done
```

## Git setup

`mv ~/.utility/dotfiles/.gitconfig ~/.gitconfig`
