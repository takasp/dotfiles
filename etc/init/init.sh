#!/bin/sh
#
# Initialize
#

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
echo y | anyenv install --init
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
anyenv install nodenv

# Remove group write permissions from the zsh directory
# Respond to "zsh compinit: insecure directories, run compaudit for list." error messages
chmod g-w /usr/local/share/zsh /usr/local/share/zsh/site-functions

