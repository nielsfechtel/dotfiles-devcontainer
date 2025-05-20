# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Bash vi-mode and re-add Ctrl-L for clear
set -o vi
bind -x '"\C-l":clear'

# Make sure LANG and LC_C are set - some tools like tmux
# need it in nested sessions for using e.g. powerline-glyphs
export LANG=en_US.utf8
export LC_ALL=en_US.utf8

# History longer
export HISTFILE=~/.histfile
export HISTSIZE=25000
export SAVEHIST=25000
export HISTCONTROL=ignorespace

alias sudo='sudo '

# basic aliases
alias ls='ls -l --color=auto'
alias ll='ls -la'
# also sort by time (-t), human-readable units (-h), reverse order (-r)
alias la='ls -lathr'

export EDITOR=nvim
export VISUAL=nvim
alias v='nvim'
alias t='tmux'

alias ..='cd ..'
alias ...='cd ../../../'
# do not delete / or prompt if deleting more than 3 files at a time
alias rm='rm -I --preserve-root'
# confirmation
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# git
alias lz='lazygit'
alias gs='git status'
function gsw() { git switch "$@"; }
function gcm() { git commit -m "$@"; }
function ga() { git add "$@"; }
function gd() { git diff "$@"; }
alias gps='git push'
alias gpl='git pull'
alias gb='git branch'
function gme() { git merge "$@"; }
function glol() { git log --graph --decorate --pretty=oneline --abbrev-commit; }
function glola() { git log --graph --decorate --pretty=oneline --abbrev-commit --all; }

# kubernetes
command -v kubectl >/dev/null && source <(kubectl completion bash)
alias k=kubectl
complete -o default -F __start_kubectl k
alias kgp='k get pods'
alias kgd='k get deployments'
alias kgn='k get namespaces'
alias kgv='k get persistentvolumeclaims'

command -v direnv >/dev/null && eval "$(direnv hook bash)"
command -v flux >/dev/null && . <(flux completion bash)
command -v devpod >/dev/null && . <(devpod completion bash)

# last step: Starship
eval "$(starship init bash)"
