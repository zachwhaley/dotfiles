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
gitdir=$(pwd)

for file in $(git ls-files); do
    if ! contains $file ${exclude[@]}; then
        ln -fTs $gitdir/$file ~/$file
    fi
done
