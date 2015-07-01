#!/bin/sh
set -e

git pull --recurse-submodules
git submodule update --remote --recursive

echo "Now, add, commit and push these changes to a new branch, then: make re"
