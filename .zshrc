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

# Aliases

# Git
alias g='git'

# Branch (b)
alias gb='git branch'
alias gba='git branch -a'

# Commit (c)
alias gc='git commit'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gamend='git commit --amend -C HEAD'

# Checkout (co)
alias gco='git checkout'
alias gcom='git checkout master'
alias gcob='git checkout -b'

# Log (l)
alias gl='git log --date=short --pretty=format:'\''%C(yellow)%h %Cgreen%cd %Cblue%cn %Creset%s'\'''
alias gll='git log --stat --decorate=short --pretty=format:'\''%C(yellow)%h %Cgreen%cr %Cblue%cn%Cred%d %Creset%s %C(cyan)%b'\'''
alias glg='git log --graph --date=short --decorate=short --pretty=format:'\''%C(yellow)%h %Cgreen%cd %Cblue%cn%Cred%d %Creset%s'\'''
alias glm='git log --merges --pretty=format:'\''%C(yellow)%h %Cgreen%ci %Cblue%cn%Cred%d %Creset%s %C(cyan)%b'\'''

# Pull (pl)
alias gpl='git pull'

# Push (pl)
alias gps='git push'

# Status (s)
alias gs='git status --short --branch'
alias gst='git status'

# Fetch (ft)
alias gft='git fetch'

# Remote (ft)
alias ginfo='git remote show origin'

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit
compinit

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH=$PATH:${JAVA_HOME}/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight
