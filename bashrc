HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export PATH="$PATH:$GOPATH/bin:$HOME/.rvm/bin"
export EDITOR="vim" 

# Prompt
export PS1="\[\e[00;33m\]\u\[\e[0m\]\[\e[00;37m\]:\[\e[0m\]\[\e[00;34m\]\w\[\e[0m\]\[\e[00;37m\]\\$ \[\e[0m\]"
export CLICOLOR=1

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ls aliases
alias ll='ls -lF'
alias la='ls -lA'
alias l='ls -CF'

alias j='jobs'

# docker aliases
alias drm='docker rm'
alias dps='docker ps'
alias drun='docker run'
alias dim='docker images'

# boot2docker
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_URL=https://192.168.59.103:2376
export DOCKER_CERT_PATH=/$HOME/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

# bash completion
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

if [ -f $HOME/.git-completion.bash ]; then
    . $HOME/.git-completion.bash
fi
export GOPATH=~/dev

export NVM_DIR="/Users/folie_a/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
