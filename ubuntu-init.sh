#!/usr/bin/env sh

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

echo "thanks for installing .dotfiles\n"

# Run all other init scripts
echo "Running all init scripts for Ubuntu init"
for i in ./vim ./bash ./linux ./git; do [ -e $i ] && $i/init.sh; done


