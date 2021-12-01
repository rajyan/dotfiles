# dotfiles

## Requirements

Requires zsh, curl, git.

## Installation

```bash
git clone https://github.com/rajyan/dotfiles
dotfiles/init.zsh
```

This script creates symlinks to dotfiles in home directory. If a file with the same name as dotfile exists, it will be renamed to file.bak. 
Delete the backup files if you want.

All zsh setups are done in .zshrc by [Zinit](https://github.com/zdharma-continuum/zinit).
It contains syntax-highlighting, suggestions, completions, prompt settings, git credential manager, direnv, homebrew... and so on.

## Benchmark

[![benchmark](https://github.com/rajyan/dotfiles/actions/workflows/benchmark.yml/badge.svg)](https://github.com/rajyan/dotfiles/actions/workflows/benchmark.yml)

Installation is tested, benchmarked in Ubuntu and macOS.
Zsh load time for each OS is tracked [here](https://rajyan.github.io/dotfiles/dev/bench/).
