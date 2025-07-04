set -g -x EDITOR nvim
set -g -x VISUAL nvim
set -g -x SHELL (which fish)
set -g -x TERM xterm-256color
set -g -x LC_ALL en_US.UTF-8
set -g -x PAGER most

if test -d /opt/homebrew/bin
    set -U fish_user_paths /opt/homebrew/bin $fish_user_paths
end

if test -d /home/linuxbrew
    set --global --export HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew"
    set --global --export HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar"
    set --global --export HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew"

    fish_add_path --global --move --path "/home/linuxbrew/.linuxbrew/bin" "/home/linuxbrew/.linuxbrew/sbin"

    if test -n "$MANPATH[1]"
        set --global --export MANPATH '' $MANPATH
    end
    if not contains "/home/linuxbrew/.linuxbrew/share/info" $INFOPATH
        set --global --export INFOPATH "/home/linuxbrew/.linuxbrew/share/info" $INFOPATH
    end

    set -gx RUBY_CONFIGURE_OPTS "--with-openssl-dir=$(brew --prefix openssl@3)"
end

set PATH $HOME/.local/bin $PATH

# Languages version manager
if type mise >/dev/null 2>&1
    if status is-interactive
        mise activate fish | source
    else
        mise activate fish --shims | source
    end
end
set -gx OBJC_DISABLE_INITIALIZE_FORK_SAFETY YES

# Node.js
if type -q fnm
    fnm env --use-on-cd | source
end

# Aliases
if type -q eza
    alias ll='eza -lF --icons'
    alias la='eza -lA --icons'
    alias ls='eza'
end

if type -q hub
    alias git='hub'
end

if type -q lazygit
    alias lzg='lazygit'
end

if type -q lazydocker
    alias lzd='lazydocker'
end

starship init fish | source

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
