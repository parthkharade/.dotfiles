#!/bin/bash

# Catppuccin Mocha colors
MAUVE='\033[38;2;203;166;247m'
BLUE='\033[38;2;137;180;250m'
GREEN='\033[38;2;166;227;161m'
PEACH='\033[38;2;250;179;135m'
LAVENDER='\033[38;2;180;190;254m'
SUBTEXT='\033[38;2;166;173;200m'
BOLD='\033[1m'
RESET='\033[0m'

echo ""
echo -e "${MAUVE}${BOLD}=== Dotfiles Setup Instructions ===${RESET}"
echo ""

step() {
    echo -e "${BLUE}${BOLD}$1.${RESET} ${LAVENDER}$2${RESET}"
}

cmd() {
    echo -e "   ${GREEN}$1${RESET}"
}

note() {
    echo -e "   ${SUBTEXT}$1${RESET}"
}

step 1 "Install Homebrew"
cmd '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/homebrew/install/HEAD/install.sh)"'
echo ""

step 2 "Install tools"
cmd "brew install neovim tmux zoxide lsd"
echo ""

step 3 "Clone dotfiles"
cmd "git clone https://github.com/parthkharade/.dotfiles.git ~/.dotfiles"
echo ""

step 4 "Run symlinks"
cmd "~/.dotfiles/symlinks.sh"
echo ""

step 5 "Install Catppuccin tmux plugin"
cmd "mkdir -p ~/.local/share/tmux/plugins"
cmd "git clone https://github.com/catppuccin/tmux ~/.local/share/tmux/plugins/catppuccin"
echo ""

step 6 "Install Neovim plugins"
note "Open nvim — Packer will auto-install on first launch"
echo ""

step 7 "iTerm2"
note "- Install 0xProto Nerd Font"
note "- Import Catppuccin Mocha color preset"
note "- Set font to: 0xProto Nerd Font"
echo ""
