set -g -x EDITOR vim
set -g -x SHELL (which fish)
set -g -x TERM xterm-256color
set -g -x LC_ALL en_US.UTF-8

set PATH /usr/local/bin /usr/sbin $PATH

if test -d $HOME/.cargo/bin
    set PATH $HOME/.cargo/bin $PATH
end

# rbenv
if type rbenv > /dev/null 2>&1
    source (rbenv init - | psub)
end

# Verify that gpg-agent config exists
if test -d $GNUPGHOME
    set -g -x SSH_AGENT_PID
    set -g -x SSH_AUTH_SOCK $HOME/.gnupg/S.gpg-agent.ssh
end

# Share system clipboard (on darwin)
if reattach-to-user-namespace > /dev/null 2>&1
    if test $REATTACHED_TO_USER_NAMESPACE != 1
        env REATTACHED_TO_USER_NAMESPACE=1 reattach-to-user-namespace -l $SHELL
    end
end

alias ll='ls -lF'
alias la='ls -lA'
