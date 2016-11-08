#!/usr/bin/env sh

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

# Backup existing i3 stuff
echo "backing up current i3 and i3status config\n"
for i in ~/.config/i3; do [ -e $i ] && mv $i $i.old; done
for i in ~/.config/i3status; do [ -e $i ] && mv $i $i.old; done

echo "Making .config/i3 and .config/i3status"
mkdir ~/.config/i3
mkdir ~/.config/i3status

# Linking tmux to dotfiles
echo "linking i3 and i3status to .dotfiles"
ln -s ~/.dotfiles/linux/i3/config ~/.config/i3/config
ln -s ~/.dotfiles/linux/i3/i3status/config ~/.config/i3status/config
