# Erix work .profile

alias coms='cat ~/.bashrc'



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


# DIRECTORY COMMANDS

alias yale='cd /z/metova/yale-control4-proxy-driver'

echo 'happy in windows :)'

