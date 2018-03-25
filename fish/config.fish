set -g -x EDITOR vim
set -g -x SHELL (which fish)
set -g -x TERM xterm-256color
set -g -x LC_ALL en_US.UTF-8
set -g -x PAGER most

if test -d $HOME/.cargo/bin
    set PATH $HOME/.cargo/bin $PATH
end

# rbenv
if type rbenv > /dev/null 2>&1
    source (rbenv init - | psub)
end

alias ll='ls -lF'
alias la='ls -lA'
