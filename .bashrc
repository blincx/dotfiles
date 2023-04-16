# Erix work .profile

alias coms='cat ~/.bashrc'

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# ssh'd into devbox but cant push?
alias startsshagent='eval `ssh-agent -s`'

# Make some possibly destructive commands more interactive.
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'


# Linux specific 
PS1="\[\e[36m\]\W\[\e[m\]\[\e[33m\]➤\[\e[m\] "


export EDITOR=vim

#HISTORY
HISTCONTROL=ignoreboth
HISTSIZE=51012
HISTFILESIZE=1000960
# MULTIPLE SHELL HISTORY LOSS WORKAROUND
export HISTCONTROL=ignoredups:erasedups  # no duplicates

# GIT
alias s='git status'

# Print last modified git branches, in proper order
alias gitlatest="git latest | sed '1!G;h;\$!d' | head -5"
alias gitlatestfull="git latest | sed '1!G;h;\$!d'"

alias remdeld='git diff --diff-filter=D --name-only -z | xargs -0 git rm'

# show hidden files
alias ls='ls -lah' # make ls show all hidden files

alias reverseorder="sed '1!G;h;\$!d'"
alias du='du -kh'    # Makes a more readable output.
alias lx='ls -lXB'      #  Sort by extension.
alias lk="ls -lSr | reverseorder"      #  Sort by size, biggest last.
alias lt="ls -ltr | reverseorder"      #  Sort by date
alias lc='ls -ltcr | reverseorder'     #  Sort by/show change time,most recent last.
alias lu='ls -ltur | reverseorder'     #  Sort by/show access time,most recent last

alias hig='history | grep'

# This is how you get core dumps!
ulimit -c unlimited

# DIRECTORY COMMANDS


echo 'happy :)'
# z 
# z is great! https://github.com/rupa/z/ 
. /home/eb/source/z/z.sh

#echo "/tmp/crash/corefiles/%e.%s.core" > /proc/sys/kernel/core_pattern
# Read in your PAT
source ~/PAT
