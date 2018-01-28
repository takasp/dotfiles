#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

export LANG=ja_JP.UTF-8

HISTSIZE=1000000
SAVEHIST=1000000

setopt print_eight_bit    # Make Japanese filename displayable
setopt no_beep            # never ever beep ever
setopt ignore_eof         # not exit on EOF
setopt hist_reduce_blanks # Delete extra space and save it in history

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH=$PATH:${JAVA_HOME}/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight
