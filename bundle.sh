#!/bin/sh

BUNDLE_DIR="${PWD}/bundle"
BUNDLE_LIST="${PWD}/bundle.list"

if [ ! -r "$BUNDLE_LIST" ]; then
    printf "${BUNDLE_LIST} is not readable\n" 2>&1
    exit 1
fi

if [ ! -d "$BUNDLE_DIR" ]; then
    mkdir -p "$BUNDLE_DIR"
fi

# Now I'm fairly sure I'm in the right directory


while read plugin_url; do
    plugin_name=$(basename "$plugin_url" ".git")
    plugin_path="${BUNDLE_DIR}/${plugin_name}"

    printf "\033[01;34m${plugin_name}\033[0m: "

    if [ ! -d "$plugin_path" ]; then
        git clone "$plugin_url" "$plugin_path"
    else
        printf "already installed\n" # maybe update it
    fi
done < "$BUNDLE_LIST"
