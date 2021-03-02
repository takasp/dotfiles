#!/bin/bash
#
# Install SDKMAN!
# https://sdkman.io/install
#
set -euC

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

