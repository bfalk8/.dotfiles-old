#!/usr/bin/env sh

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

# Link .gitconfig
echo "Linking .gitconfig"
for i in ~/.gitconfig; do [ -e $i ] && mv $i $i.old; done

ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig

# Run git init script
echo "Running git init"
git config --global user.email "bfalk@ucsd.edu"
git config --global user.name "bfalk8"
git config --global push.default simple

