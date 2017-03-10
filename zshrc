# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    .zshrc                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marin <mravenel@student.42.fr>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2014/10/02 10:51:08 by marin             #+#    #+#              #
#    Updated: 2016/01/29 17:47:13 by mravenel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="marin42"
#ZSH_THEME="dracula"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
#export PATH="/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin:/home/marin/bin"

export PATH="$HOME/.brew/bin:$HOME/dotfiles/bin:$PATH"

# This function called c makes ls command call automatically after a successful cd
c() { cd "$@" && ls "-la"; }

alias l="ls -l"
alias la="ls -la"
alias cl="clear"

#GOPATH
#export PATH="$PATH:$GOPATH/bin:$HOME/.rvm/bin"

export EDITOR="vim"
export MAIL="mravenel@student.42.fr"
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export GREP_OPTIONS="--color=always"
export HOMEBREW_GITHUB_API_TOKEN="8a9ce66497180e943aaa706f9015e8241241b935"

#PHP PATHS
#export PATH="/Applications/MAMP/bin/php/php5.3.28/bin/:$PATH"
export PATH="$HOME/bin:$PATH"
#export PHP_AUTOCONF="/usr/local/bin/autoconf"

#Improved less
#export LESS="-i-P%f (%i/%m) Line %lt/%L"

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

alias railsongs="ssh -i $HOME/.ssh/MarinMainKey.pem ubuntu@52.201.136.198"
alias keyrepeat="defaults write -g ApplePressAndHoldEnabled -bool false"
alias keyrepeat_on="defaults write -g ApplePressAndHoldEnabled -bool true"
alias mdv='$HOME/bin/terminal_markdown_viewer/mdv.py'

#Azure rg keys
export AZURE_STORAGE_ACCESS_KEY=nozic0IQz4/BXOWxMacgghOCi3W6fvNaeKmY1AmmOvBe+d0kKWv7Jq2McJYEsyCN5PJ80PDb+EFBaogAX9GiMw==
export AZURE_STORAGE_ACCOUNT=mojjocdnstorage


