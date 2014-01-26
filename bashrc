#!/bin/bash

#Bash completion
if [ -f /etc/bash_completion ];then
    source /etc/bash_completion
fi

#PS1
export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h:\[\e[33m\]\w\[\e[0m\]\n\$ '

#Editor
export EDITOR=vim

alias grep='grep --color=auto --exclude-dir=\.svn --exclude-dir=\.git'

#load alias
if [ -f ~/.aliases ];then
    source ~/.aliases
fi

if [ -f ~/.bash_aliases ]
    source ~/.bash_aliases
fi
