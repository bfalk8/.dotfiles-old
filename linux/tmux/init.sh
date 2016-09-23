#!/usr/bin/env sh

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

echo "Performing tmux init\n"

# Backup existing .vim stuff
echo "backing up current tmux config\n"
for i in ~/.tmux.conf; do [ -e $i ] && mv $i $i.old; done

# Linking vim to dotfiles
echo "linking tmux to .dotfiles"
ln -s ~/.dotfiles/linux/tmux/.tmux.conf ~/.tmux.conf
