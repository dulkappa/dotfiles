##=============================================================================
# .zshrc
##-----------------------------------------------------------------------------
# Author : dulkappa
# Created : 2014.08.15
##=============================================================================

## General Settings
# autoload
autoload -Uz compinit
compinit
autoload -Uz colors

# editor (emacs)
export EDITOR=/usr/bin/emacs

# keybind (like emacs)
bindkey -e

# alias
alias la='ls -la'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# japanese setting
export LANG=ja_JP.UTF-8
setopt print_eight_bit


## Visual Settings
# lsコマンド時、自動で色付け
export CLICOLOR=true

# prompt interface
PROMPT="%{${fg[red]}%}[%n@%m]%{${reset_color}%} %~
%# "


## Coding Settings
# rbenv
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
