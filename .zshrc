umask 022
limit coredumpsize 0

export LANG=ja_JP.UTF-8

autoload -Uz colors
colors

bindkey -e

# history configuration
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# PROMPT
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
%# "

# set characters which are considered word characters
autoload -Uz select-word-style
select-word-style default
# only these characters are not considered word characters
zstyle ':zle:*' word-chars ' /=;@:{}[]()<>,|"'\'
zstyle ':zle:*' word-style unspecified

autoload -Uz compinit
compinit

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ignore current directory
zstyle ':completion:*' ignore-parents parent pwd ..

zstyle ':completion:*:processes' command "ps -u $USER -o pid,stat,%cpu,command"

# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' max-exports 6

zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats '(%s)-[%b]' '%m' '%R' '%r' '%S'
# %m is expanded to empty string
zstyle ':vcs_info:*' actionformats '(%s)-[%b]' '%m' '%R' '%r' '%S' '<!%a>'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true

#function _update_vcs_info_msg() {
#    LANG=en_US.UTF-8 vcs_info
#    RPROMPT="${vcs_info_msg_0_}"
#}
#add-zsh-hook precmd _update_vcs_info_msg
function _update_vcs_info_msg() {
    local -a messages
    local prompt

    psvar=()

    LANG=en_US.UTF-8 vcs_info

    if [[ -z ${vcs_info_msg_0_} ]]; then
        # nothing from vcs_info
        prompt=""
    else
        # vcs_info found something
        # require 'autoload -Uz colors'
        [[ -n "$vcs_info_msg_0_" ]] && messages+=( "%F{green}${vcs_info_msg_0_}%f" )
        [[ -n "$vcs_info_msg_1_" ]] && messages+=( "%F{yellow}${vcs_info_msg_1_}%f" )
        [[ -n "$vcs_info_msg_5_" ]] && messages+=( "%F{red}${vcs_info_msg_5_}%f" )

        prompt="${(j: :)messages}"

        # set psvar for PROMPT
        # substitute $HOME to ~
        local base_directory=$(print -nD "$vcs_info_msg_2_")
        local repository_name="$vcs_info_msg_3_"
        local up_directory=${base_directory%${repository_name}}

        local subdirectory_within_a_repository="$vcs_info_msg_4_"

        if [[ "$subdirectory_within_a_repository" == "" || "$subdirectory_within_a_repository" == "." ]]; then
            subdirectory_within_a_repository=""
        else
            subdirectory_within_a_repository="/$subdirectory_within_a_repository"
        fi

        psvar[1]="$up_directory"
        psvar[2]="$repository_name"
        psvar[3]="$subdirectory_within_a_repository"
    fi

    RPROMPT="$prompt"
}
add-zsh-hook precmd _update_vcs_info_msg

setopt print_eight_bit

# never ever beep ever
setopt no_beep

# disable flow control
setopt no_flow_control

# not exit on EOF
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# cd
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

# history configuration
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

setopt extended_glob

########################################
# keybind

bindkey '^R' history-incremental-pattern-search-backward

########################################
# aliases

alias la='ls -a'
alias ll='ls -lh'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

# enable alias to sudo command argument
alias sudo='sudo '

# global aliases
alias -g L='| less'
alias -g G='| grep'

if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi

# for MAC
export CLICOLOR=1
alias ls='ls -G -F'

alias vi="vim"
fpath=(/usr/local/share/zsh/site-functions(N-/) $fpath)

autoload -Uz compinit
compinit

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH=$PATH:${JAVA_HOME}/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight
