#!/bin/bash
#
# Initialize
#
set -euC

ROOT_DIR=$(pwd)
files=$(echo $ROOT_DIR/etc/setup/*.sh)

for i in $files
do
    bash "$i"
done

# Homebrew
brew bundle
brew cleanup

# anyenv
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
anyenv install nodenv

