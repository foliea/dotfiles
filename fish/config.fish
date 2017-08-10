set -g -x __GIT_PROMPT_DIR ~/.config/fish/tools

set -g -x EDITOR vim
set -g -x SHELL (which fish)
set -g -x TERM xterm-256color

set -g -x LC_ALL en_US.UTF-8

set -x GOPATH ~/dev/go

set PATH /usr/local/bin /usr/sbin $HOME/.cargo/bin $PATH

# rbenv
if type rbenv > /dev/null 2>&1
    source (rbenv init - | psub)
end

# Tmux
if not test $TMUX;
    if type tmux > /dev/null 2>&1
        tmux has-session -t default; and tmux attach-session -t default; or tmux new-session -s default; and kill %self
    end
end

# Caps lock
if type setxkbmap > /dev/null 2>&1
    setxkbmap -layout us -option ctrl:nocaps
end

alias ll='ls -lF'
alias la='ls -lA'
alias l='ls -CF'
alias j='jobs'
