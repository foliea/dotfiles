HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# gitprompt configuration

# Set config variables first
# GIT_PROMPT_ONLY_IN_REPO=1

# GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status

# GIT_PROMPT_START=...    # uncomment for custom prompt start sequence
# GIT_PROMPT_END=...      # uncomment for custom prompt end sequence

# as last entry source the gitprompt script
# GIT_PROMPT_THEME=Custom # use custom .git-prompt-colors.sh
# GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme
source ~/.bash-git-prompt/gitprompt.sh

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# aliases
alias ll='ls -lF'
alias la='ls -lA'
alias l='ls -CF'
alias j='jobs'

# docker aliases
alias drm='docker rm'
alias dps='docker ps'
alias drun='docker run'
alias dim='docker images'

if [ `uname` == "Darwin" ]; then
    # alias macvim on darwin
    alias vim='mvim -v'

    # Set boot2docker env variables
    export DOCKER_CERT_PATH="$HOME/.boot2docker/certs/boot2docker-vm"
    export DOCKER_TLS_VERIFY=1
    export DOCKER_HOST="tcp://192.168.59.103:2376"
    export DOCKER_URL="https://192.168.59.103:2376"
fi

# bash completion
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# additional env variables
export PATH="/usr/local/bin:$PATH:$GOPATH/bin:$HOME/.rvm/bin"
export EDITOR="vim"
export CLICOLOR=1
export NVM_DIR="$HOME/.nvm"

# Load nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
