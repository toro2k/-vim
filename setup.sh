#!/bin/sh

SCRIPT_NAME=$(basename "$0")
VIM_DIR="$HOME/.vim"

FORCE=0
if [ "$1" = "-f" ]; then
    FORCE=1
    shift
fi

if [ ! -d "$VIM_DIR" ]; then
    echo "$VIM_DIR is missing!" 2>&1
    exit 1
fi

for FILE in ".vimrc" ".gvimrc"; do
    TARGET="$VIM_DIR/$FILE"
    LINK_NAME="$HOME/$FILE"

    if [ ! -r "$TARGET" ]; then
        echo "$TARGET is missing!" 2>&1
        exit 1
    fi

    if [ -e "$LINK_NAME" -a "$FORCE" -eq 0 ]; then
        echo "$TARGET already exists!" 2>&1
        exit 1
    fi

    ln -sf "$TARGET" "$LINK_NAME"
done
