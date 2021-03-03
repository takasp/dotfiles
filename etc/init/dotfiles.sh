#!/bin/sh

ROOT_DIR="$HOME/dev/src/github.com/takasp"
mkdir -p $ROOT_DIR
git clone --recursive https://github.com/takasp/dotfiles.git $ROOT_DIR/dotfiles
cd $ROOT_DIR/dotfiles
make init

