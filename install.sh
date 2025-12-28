#!/bin/bash

set -e

DOTFILES_DIR="$HOME/ghq/github.com/nkoji21/dotfiles"

echo "Setting up dotfiles..."

# Create directories if not exist
mkdir -p ~/.config/mise
mkdir -p ~/.config/aqua
mkdir -p ~/.config/ghostty
mkdir -p ~/.claude

# Symlink home directory files
ln -sf "$DOTFILES_DIR/.gitconfig" ~/.gitconfig
ln -sf "$DOTFILES_DIR/.zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/.zprofile" ~/.zprofile

# Symlink .claude files
ln -sf "$DOTFILES_DIR/.claude/CLAUDE.md" ~/.claude/CLAUDE.md
ln -sf "$DOTFILES_DIR/.claude/commands" ~/.claude/commands

# Symlink .config subdirectories
ln -sf "$DOTFILES_DIR/mise/config.toml" ~/.config/mise/config.toml
ln -sf "$DOTFILES_DIR/aqua/aqua.yaml" ~/.config/aqua/aqua.yaml
ln -sf "$DOTFILES_DIR/aqua/imports" ~/.config/aqua/imports
ln -sf "$DOTFILES_DIR/ghostty/config" ~/.config/ghostty/config

echo "Dotfiles setup complete!"
echo ""
echo "Installed symlinks:"
echo "  ~/.gitconfig -> $DOTFILES_DIR/.gitconfig"
echo "  ~/.zshrc -> $DOTFILES_DIR/.zshrc"
echo "  ~/.zprofile -> $DOTFILES_DIR/.zprofile"
echo "  ~/.claude/CLAUDE.md -> $DOTFILES_DIR/.claude/CLAUDE.md"
echo "  ~/.claude/commands -> $DOTFILES_DIR/.claude/commands"
echo "  ~/.config/mise/config.toml -> $DOTFILES_DIR/mise/config.toml"
echo "  ~/.config/aqua/aqua.yaml -> $DOTFILES_DIR/aqua/aqua.yaml"
echo "  ~/.config/aqua/imports -> $DOTFILES_DIR/aqua/imports"
echo "  ~/.config/ghostty/config -> $DOTFILES_DIR/ghostty/config"
