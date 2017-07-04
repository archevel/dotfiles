#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


export PATH="$HOME/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export GOPATH="$HOME/code/go"
export PATH="$PATH:$GOPATH/bin"
