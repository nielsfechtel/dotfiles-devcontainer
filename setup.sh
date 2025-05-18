#!/bin/bash

export XDG_CONFIG_HOME="$HOME"/.config
mkdir -p "$XDG_CONFIG_HOME"

# Create symlinks for existing configurations
ln -sf "$PWD/nvim" "$XDG_CONFIG_HOME"/nvim
ln -sf "$PWD/k9s" "$XDG_CONFIG_HOME"/k9s
ln -sf "$PWD/.inputrc" "$HOME"/.inputrc
ln -sf "$PWD/tmux.conf" "$HOME"/.tmux.conf
ln -sf "$PWD/.bashrc" "$HOME"/.bashrc
ln -sf "$PWD/starship.toml" "$XDG_CONFIG_HOME"/starship.toml

packages=(
  starship
  tmux
)

# Iterate over the array and install each package
for package in "${packages[@]}"; do
  echo "Installing $package..."
  /home/linuxbrew/.linuxbrew/bin/brew install "$package"
done
