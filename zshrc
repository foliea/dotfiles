# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    .zshrc                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marin <mravenel@student.42.fr>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2014/10/02 10:51:08 by marin             #+#    #+#              #
#    Updated: 2014/12/03 15:07:40 by modizy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="marin42"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

#export PATH="/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin:/home/marin/bin"

# This function called c makes ls command call automatically after a successful cd
c() { cd "$@" && ls "-la"; }

alias l="ls -l"
alias la="ls -la"
alias status="git status"
alias cl="clear"
export GOPATH="$HOME/dev/go"
export PATH="$PATH:$GOPATH/bin:$HOME/.rvm/bin"
export EDITOR="vim"
export MAIL="mravenel@student.42.fr"
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export PATH="/Applications/MAMP/bin/php/php5.3.28/bin/:$PATH"
export PHP_AUTOCONF="/usr/local/bin/autoconf"
export GREP_OPTIONS="--color=always"

#Improved less
export LESS="-i-P%f (%i/%m) Line %lt/%L"
