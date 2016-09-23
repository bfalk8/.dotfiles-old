#!/usr/bin/env sh

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

echo "Performing zsh init\n"

# Backup existing .vim stuff
echo "backing up current zsh config\n"
for i in ~/.zshrc; do [ -e $i ] && mv $i $i.old; done

# Linking vim to dotfiles
echo "linking zsh to .dotfilesi\n"
ln -s ~/.dotfiles/linux/zsh/.zshrc ~/.zshrc

echo "installing oh-my-zsh\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "linking oh-my-zsh alias\n"
ln -s ~/.dotfiles/linux/zsh/alias.zsh ~/.oh-my-zsh/lib/alias.zsh

