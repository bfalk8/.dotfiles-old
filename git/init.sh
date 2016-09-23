#!/usr/bin/env sh

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

echo "Performing git init\n"

# Link .gitconfig
echo "Linking .gitconfig\n"
for i in ~/.gitconfig; do [ -e $i ] && mv $i $i.old; done

ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig

# Run git init script
echo "Running git init\n"
git config --global user.email "bfalk@ucsd.edu"
git config --global user.name "bfalk8"
git config --global push.default simple

