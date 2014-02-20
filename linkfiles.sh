#!/bin/bash

# Returns 0 if the 1st arg is found in the other args; 1 otherwise.
contains () {
    for e in "${@:2}"; do
        [[ ${e} == ${1} ]] && return 0;
    done
    return 1
}

# A list of files to exclude from symoblic linking
exclude=( "README.md" "linkfiles.sh" )

for file in $(git ls-files); do
    if ! contains $file ${exclude[@]}; then
        mkdir -p ~/$(dirname $file)
        ln -vfTs $(pwd)/$file ~/$file
    fi
done
