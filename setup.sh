#!/bin/bash

# Initialize and update submodules
git submodule init
git submodule update

export XDG_CONFIG_HOME="$HOME"/.config
mkdir -p "$XDG_CONFIG_HOME"

# Create symlinks for existing configurations
ln -sf "$PWD/shared/nvim" "$XDG_CONFIG_HOME"/nvim
ln -sf "$PWD/shared/k9s" "$XDG_CONFIG_HOME"/k9s
ln -sf "$PWD/.inputrc" "$HOME"/.inputrc
ln -sf "$PWD/shared/tmux.conf" "$HOME"/.tmux.conf
ln -sf "$PWD/shared/starship.toml" "$XDG_CONFIG_HOME"/starship.toml
ln -sf "$PWD/.bashrc" "$HOME"/.bashrc

packages=(
  starship
  tmux
)

# Iterate over the array and install each package
for package in "${packages[@]}"; do
  echo "Installing $package..."
  /home/linuxbrew/.linuxbrew/bin/brew install "$package"
done
