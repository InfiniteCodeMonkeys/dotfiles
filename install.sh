#!/bin/bash

DF="$HOME/dotfiles"

# Ensure Homebrew exists
if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found — installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Add Homebrew to PATH (macOS ARM default)
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install everything from Brewfile
brew bundle --file="$DF/Brewfile"

# Zsh
ln -sf "$DF/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$DF/zsh/.zprofile" "$HOME/.zprofile"

# Git
ln -sf "$DF/git/.gitconfig" "$HOME/.gitconfig"

# Ghostty
mkdir -p "$HOME/.config/ghostty"
ln -sf "$DF/ghostty/config" "$HOME/.config/ghostty/config"

# VSCode
mkdir -p "$HOME/Library/Application Support/Code/User"
ln -sf "$DF/vscode/settings.json" \
  "$HOME/Library/Application Support/Code/User/settings.json"

echo "Dotfiles installed."
