#!/bin/sh

rm_if_readable() {
    [ -r "$1" ] && rm -i "$1"
}

link_if_not_exists() {
    [ -e "$2" ] || ln -sf "$1" "$2"
}

if [ $# -ne 1 ]; then
    echo "usage: ${0} VIMFILES" 2>&1
    exit 1
fi

vimfiles=$(realpath $1)

rm_if_readable "${HOME}/.vim"
rm_if_readable "${HOME}/.vimrc"
rm_if_readable "${HOME}/.gvimrc"

link_if_not_exists "$vimfiles" "${HOME}/.vim"
link_if_not_exists "$vimfiles/vimrc" "${HOME}/.vimrc"
link_if_not_exists "$vimfiles/gvimrc" "${HOME}/.gvimrc"

if [ -x "${vimfiles}/bundle.sh" ]; then
    "${vimfiles}/bundle.sh" "$vimfiles"
fi
