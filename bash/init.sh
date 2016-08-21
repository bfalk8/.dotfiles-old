#!/usr/bin/env sh

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}


# Backup existing .vim stuff
echo "backing up current vim config\n"
for i in ~/.bashrc ; do [ -e $i ] && mv $i $i.old; done


echo "linking .bashrc to .dotfiles"
ln -s ~/.dotfiles/bash/.bashrc ~/.bashrc

