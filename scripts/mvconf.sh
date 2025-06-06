#!/bin/sh

set -euo pipefail
IFS=$'\n\t'

# ========= Logging ==========
log()   { echo -e "\033[1;32m[INFO]\033[0m $*"; }

# ========= Begin Setup ==========

log "Ensuring directories exist..."
mkdir -p ~/.config
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/neofetch
mkdir -p ~/.oh-my-zsh/themes

log "Copying dotfiles..."
cp ../conf/zshrc ~/.zshrc
cp ../conf/p10k.zsh ~/.p10k.zsh
cp ../conf/vimrc ~/.vimrc
cp ../conf/alacritty.toml ~/.config/alacritty/alacritty.toml
cp ../conf/tty.zsh-theme ~/.oh-my-zsh/themes/tty.zsh-theme

log "Configuration files deployed successfully."
