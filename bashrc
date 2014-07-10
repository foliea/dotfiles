# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export PATH="$PATH:$HOME/.rvm/bin"
export DOCKER_DEV_VERSION="1.1.1"
# Prompt
export PS1="\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ "
export CLICOLOR=1

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -lF'
alias la='ls -lA'
alias l='ls -CF'

# Docker
alias sdd='sudo service docker stop ; sudo cp $(which docker) $(which docker)_ ; sudo cp ./bundles/$DOCKER_DEV_VERSION-dev/binary/docker-$DOCKER_DEV_VERSION-dev $(which docker); sudo service docker start'
alias sd='sudo service docker stop ; sudo cp $(which docker)_ $(which docker) ; sudo cp $(which docker) ./bundles/$DOCKER_DEV_VERSION-dev/binary/docker-$DOCKER_DEV_VERSION-dev ; sudo service docker start'
alias mdock='sd; sudo make binary ; sdd ; sudo docker version'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi
