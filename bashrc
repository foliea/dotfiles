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

# Prompt
export PS1="\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ "
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

# docker aliases
alias drm='docker rm'
alias dps='docker ps'
alias drun='docker run'

# git aliases
alias gc='git commit'
alias gs='git status'
alias gck='git checkout'
alias gf='git fetch'

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