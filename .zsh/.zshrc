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
# emacs
alias emacs='/usr/local/Cellar/emacs/24.3/bin/emacs -nw'

# node.js
source ~/.nvm/nvm.sh
nvm use "v0.10.0"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# rbenv
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/versions/2.1.2/bin:$PATH"
export PATH="$PATH:/sbin"
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
