#!/usr/bin/env sh

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

echo "thanks for installing .dotfiles\n"

# Backup existing .vim stuff
echo "backing up current vim config\n"
for i in ~/.vim ~/.vimrc ~/.gvimrc; do [ -e $i ] && mv $i $i.old; done


# echo "cloning spf13-vim\n"
# git clone --recursive git://github.com/spf13/spf13-vim.git ~/.spf13-vim 
echo "linking to .dotfiles"
ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/.dotfiles/vim/.vim ~/.vim

