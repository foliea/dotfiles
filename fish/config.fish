set -g -x EDITOR nvim
set -g -x VISUAL nvim
set -g -x SHELL (which fish)
set -g -x TERM xterm-256color
set -g -x LC_ALL en_US.UTF-8
set -g -x PAGER "bat --paging=always"
set -g -x BAT_THEME base16

if test -d /opt/homebrew/bin
    fish_add_path --move /opt/homebrew/bin
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

fish_add_path --move $HOME/.local/bin

# Languages version manager
if type -q mise
    if status is-interactive
        mise activate fish | source
    else
        mise activate fish --shims | source
    end
end
set -gx OBJC_DISABLE_INITIALIZE_FORK_SAFETY YES

# Functions (preferred over aliases)
if type -q eza
    function ll
        eza -lF --icons $argv
    end
    function la
        eza -lA --icons $argv
    end
    function ls
        eza $argv
    end
end

if type -q rg
    function grep
        rg $argv
    end
end

if type -q bat
    function cat
        bat $argv
    end
end

if type -q hub
    function git
        hub $argv
    end
end

if type -q lazygit
    function lzg
        lazygit $argv
    end
end

if type -q lazydocker
    function lzd
        lazydocker $argv
    end
end

function gbs
    git branch | sed 's/  *//' | fzf --preview-window=right:60% --preview 'git log --oneline --graph --date=relative --branches={1} --' | xargs git switch
end

starship init fish | source

set -g fish_key_bindings fish_vi_key_bindings

set -g fisher_path $HOME/.config/fish/plugins

set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path
set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path

for file in $fisher_path/conf.d/*.fish
    builtin source $file 2>/dev/null
end

if test -f $HOME/.orbstack/shell/init2.fish
    source $HOME/.orbstack/shell/init2.fish 2>/dev/null
end
