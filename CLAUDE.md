# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles for a developer focused on embedded systems (C/C++, Verilog, VHDL), Python, and LaTeX. Primary editor is Neovim. Primary shell is Zsh on macOS; Bash config is for Linux environments.

## Installation

Run `./setupins.sh` to print full setup instructions including tool installation. Run `./symlinks.sh` to create symlinks — it is idempotent and can be re-run safely.

External dependencies that must be cloned/installed manually:
- Catppuccin tmux plugin: `git clone https://github.com/catppuccin/tmux ~/.local/share/tmux/plugins/catppuccin`

There are no build, lint, or test commands — this is a configuration-only repo.

## Structure

```
.dotfiles/
├── .bashrc          → ~/.bashrc
├── .zshrc           → ~/.zshrc
├── .config/
│   ├── nvim/        → ~/.config/nvim
│   ├── tmux/        → ~/.config/tmux
│   └── lsd/         → ~/.config/lsd
├── symlinks.sh
└── setupins.sh
```

## Neovim (`.config/nvim/`)

Entry point: `init.lua`, which sources:
- `lua/plugins.lua` — Packer plugin declarations
- `lua/settings.lua` — Editor options (tabs, clipboard, colorscheme)
- `lua/keymaps.lua` — Global key bindings
- `lua/plugin_configs/init.lua` — Loads all per-plugin config files

Plugin configs live in `lua/plugin_configs/` with one file per plugin. Adding a new plugin means declaring it in `plugins.lua` and optionally adding a config file there.

**LSP setup**: Uses two systems in parallel:
- `coc.nvim` (via `coc_config.lua` + `coc-settings.json`) for completion UI
- `nvim-lspconfig` + `mason.nvim` (via `lsp_config.lua`) for language servers (clangd, pyright, texlab)

**File templates**: `nvim/skeleton/` contains `.skel` files for C, headers, Verilog, and VHDL. The `skeletons.lua` config maps file extensions to templates via `skel-nvim`.

### Key Bindings

| Key | Action |
|-----|--------|
| `Ctrl+P` | Telescope find files |
| `Ctrl+L` | Telescope live grep |
| `Ctrl+K` | Telescope buffers |
| `Space+Space` | Recent files |
| `gd` / `gy` / `gi` / `gr` | LSP: definition / type def / implementation / references |
| `Ctrl+S` | Save |
| `Ctrl+Q` | Toggle line number mode |

## Tmux (`.config/tmux/tmux.conf`)

- Prefix: `Ctrl+A`
- Vi-mode copy with `pbcopy` integration
- Splits: `|` (horizontal), `-` (vertical)
- Pane navigation: `h/j/k/l`
- Catppuccin Mocha theme via plugin at `~/.local/share/tmux/plugins/catppuccin`
- Status bar: session name (left), git branch of current pane path (right)

## Shell

**Zsh** (`.zshrc`) — primary shell on macOS. Catppuccin Mocha prompt, zoxide, `ls` aliased to `lsd`.

**Bash** (`.bashrc`) — for Linux environments. Catppuccin Mocha prompt, zoxide, `ls` aliased to `lsd`, PATH for Neovim/TexLive/protobuf/vcpkg.

## lsd (`.config/lsd/`)

Icons disabled. Catppuccin Mocha colors via `colors.yaml` with `theme: custom`.
