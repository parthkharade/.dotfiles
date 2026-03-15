#!/bin/bash

DOTFILES="$HOME/.dotfiles/.config"
CONFIG="$HOME/.config"

link() {
    ln -sfn "$1" "$2"
}

link "$DOTFILES/nvim"        "$CONFIG/nvim"
link "$DOTFILES/lsd"         "$CONFIG/lsd"
link "$DOTFILES/tmux"        "$CONFIG/tmux"
link "$DOTFILES/bash/bashrc" "$HOME/.bashrc"
link "$DOTFILES/.zshrc"      "$HOME/.zshrc"
# Tmux plugins (run once)
# mkdir -p ~/.local/share/tmux/plugins
# git clone https://github.com/catppuccin/tmux ~/.local/share/tmux/plugins/catppuccin
