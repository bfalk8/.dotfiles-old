#!/usr/bin/env sh

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}


# Run git init script
echo "Running git init"t config --global user.email "you@example.com"
git config --global user.email "bfalk@ucsd.edu"
git config --global user.name "bfalk8"
git config --global push.default simple

