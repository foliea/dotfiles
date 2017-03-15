set -g -x __GIT_PROMPT_DIR ~/.bash-git-prompt

set -g -x EDITOR vim
set -g -x TERM xterm-256color

set -g -x LC_ALL en_US.UTF-8

set -x GOPATH ~/dev/go

# rbenv
if type rbenv > /dev/null
  source (rbenv init - | psub)
end

set PATH /usr/local/bin /usr/sbin $PATH

alias ll='ls -lF'
alias la='ls -lA'
alias l='ls -CF'
alias j='jobs'
