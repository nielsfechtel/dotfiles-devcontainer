#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export VISUAL=nvim
export EDITOR=nvim
export TERM=tmux-256color

export HISTFILE=~/.histfile
export HISTSIZE=25000
export SAVEHIST=25000
export HISTCONTROL=ignorespace

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Bash vi-mode and re-add Ctrl-L for clear
set -o vi
bind -x '"\C-l":clear'

# Make aliases work with sudo, from askubuntu.com/questions/22037
# "Bash only checks the first word of a command for an alias. [...] We can tell bash to check
# the next word after the alias (i.e. sudo) by adding a space at the end of the alias value"
# Note that this breaks if using a flag for sudo; there are other longer solutions in the same question.
alias sudo='sudo '

# fzf with preview
alias fzfp='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'

# basic aliases
alias ls='ls -l --color=auto'
alias ll='ls -la'
# also sort by time (-t), human-readable units (-h), reverse order (-r)
alias la='ls -lathr'

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
source <(kubectl completion bash)
alias k=kubectl
complete -o default -F __start_kubectl k
alias kgp='k get pods'
alias kgd='k get deployments'
alias kgn='k get namespaces'
alias kgv='k get persistentvolumeclaims'

# fzf 
# (register shell integration like using fzf for Ctrl+r, etc.)
eval "$(fzf --bash)"
# add alias for opening in nvim
alias vf='fzf --bind "enter:become(nvim {})"'

eval "$(direnv hook bash)"

command -v flux >/dev/null && . <(flux completion bash)
command -v devpod >/dev/null && . <(devpod completion bash)

# last step: Starship
eval "$(starship init bash)"
