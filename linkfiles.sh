#!/bin/bash

# A list of files to exclude from symoblic linking
exclude=("README.md")
gitdir=$(pwd)

for file in $(git ls-files); do
    for e in $exclude; do
        if [[ ! $e == $file ]]; then
            ln -fTs $gitdir/$file ~/$file
        fi
    done
done
