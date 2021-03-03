#!/bin/sh
#
# Install dein.vim
# https://github.com/Shougo/dein.vim
#

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $HOME/Downloads/installer.sh
sh $HOME/Downloads/installer.sh ~/.cache/dein

