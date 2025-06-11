set -g -x EDITOR vim
set -g -x SHELL (which fish)
set -g -x TERM xterm-256color
set -g -x LC_ALL en_US.UTF-8
set -g -x PAGER most

if test -d /opt/homebrew/bin
    set -U fish_user_paths /opt/homebrew/bin $fish_user_paths
end

if test -d $HOME/.cargo/bin
    set PATH $HOME/.cargo/bin $PATH
end

# rbenv
if type rbenv >/dev/null 2>&1
    status --is-interactive; and source (rbenv init -|psub)
end
set -gx OBJC_DISABLE_INITIALIZE_FORK_SAFETY YES

# node.js
if type -q fnm
    fnm env --use-on-cd | source
end

# golang
if which go >/dev/null 2>&1
    set -g -x GOPATH $HOME/dev/go
end

## brew
if which brew >/dev/null 2>&1
    alias python=/opt/homebrew/bin/python3
end

alias ll='ls -lF'
alias la='ls -lA'
alias git='hub'
alias python=python3

set -g fish_key_bindings fish_vi_key_bindings

set -g fisher_path $HOME/.config/fish/plugins

set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path
set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path

for file in $fisher_path/conf.d/*.fish
    builtin source $file 2>/dev/null
end

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.fish ]; and . ~/.config/tabtab/__tabtab.fish; or true

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
