#!/bin/sh

if [ $# -ne 1 ]; then
    echo "usage: $0 VIMFILES" 2>&1
    exit 1
fi

vimfiles=$(realpath $1)

ln -sf "$vimfiles" "$HOME/.vim"
ln -sf "$vimfiles/.vimrc" "$HOME/.vimrc"
ln -sf "$vimfiles/.gvimrc" "$HOME/.gvimrc"
