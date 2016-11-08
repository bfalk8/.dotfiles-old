#!/usr/bin/env sh

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

echo "Running Linux scripts\n"

# Make .config directory
echo "mkdir .config"
mkdir ~/.config

# Run all other init scripts
echo "Running all init scripts for Linux init"
for i in ../git ./vim ./zsh ./tmux; do [ -e $i ] && $i/init.sh; done
