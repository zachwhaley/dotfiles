#!/bin/bash

# A "|" separated list of files to exclude from symoblic linking
exclude=".git|README.md|linkfiles.sh"

for file in $(ls -A | egrep -v $exclude); do
    ln -vfs $(pwd)/$file ~/$file
done
