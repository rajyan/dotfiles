# dotfiles

## benchmark
[![benchmark](https://github.com/rajyan/dotfiles/actions/workflows/benchmark.yml/badge.svg)](https://github.com/rajyan/dotfiles/actions/workflows/benchmark.yml)

Tested in Ubuntu and macOS.
Zsh load time for each OS is tracked [here](https://rajyan.github.io/dotfiles/dev/bench/).

## Installation

```bash
cd $HOME
git clone https://github.com/rajyan/dotfiles
cd dotfiles && ./init.zsh
```

This script creates symlinks to dotfiles in home directory, and saves a file with the same name as a backup file if they already exist. 
Delete the backup files if you want.

All zsh setups are done in .zshrc by [Zinit](https://github.com/zdharma-continuum/zinit).
It contains syntax-highlighting, suggestions, completions, prompt settings, git credential manager, direnv, homebrew... and so on.
