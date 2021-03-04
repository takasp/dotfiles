#!/bin/sh
#
# Install Powerline
# https://github.com/powerline/powerline
#

# Install powerline-status
pip3 install powerline-status
# Install font
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

