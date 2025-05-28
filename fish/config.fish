set -g -x EDITOR vim
set -g -x SHELL (which fish)
set -g -x TERM xterm-256color
set -g -x LC_ALL en_US.UTF-8
set -g -x PAGER most

if test -d $HOME/.cargo/bin
    set PATH $HOME/.cargo/bin $PATH
end

# rbenv
if type rbenv >/dev/null 2>&1
    status --is-interactive; and source (rbenv init -|psub)
end

# golang
if which go >/dev/null 2>&1
    set -g -x GOPATH $HOME/dev/go
end

## brew
if which brew >/dev/null 2>&1
    alias python=/opt/homebrew/bin/python3
end

# nvm
set -gx NVM_DIR $HOME/.nvm
set --universal nvm_default_version 20

alias ll='ls -lF'
alias la='ls -lA'
alias git='hub'

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
