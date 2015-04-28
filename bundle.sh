#!/bin/sh

if [ $# -ne 1 ]; then
    echo "usage: ${0} VIMFILES" 2>&1
    exit 1
fi

vimfiles=$(realpath $1)

bundle_dir="${vimfiles}/bundle"
bundle_list="${vimfiles}/bundle.list"

if [ ! -r "$bundle_list" ]; then
    printf "${bundle_list} is not readable\n" 2>&1
    exit 1
fi

if [ ! -d "$bundle_dir" ]; then
    mkdir -p "$bundle_dir"
fi

while read plugin_url; do
    plugin_name=$(basename "$plugin_url" ".git")
    plugin_path="${bundle_dir}/${plugin_name}"

    printf "[01;34m${plugin_name}[0m: "

    if [ ! -d "$plugin_path" ]; then
        git clone "$plugin_url" "$plugin_path"
    else
        printf "already installed. Updating...\n"
        cd "$plugin_path"
        git pull
        cd - > /dev/null
    fi
done < "$bundle_list"
