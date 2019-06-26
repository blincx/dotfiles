# Erix work .profile

alias coms='cat ~/.bashrc'



alias notes='vim /c/Users/ericb/Dropbox/metova/NOTES'


# ssh'd into devbox but cant push?
alias startsshagent='eval `ssh-agent -s`'



# ffmpeg command: ffmpeg -i "input.mp4" -ab 128k "output.mp3"

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

# After each command, save and reload history
# I think this is causing bleedthrough on screen sessions
#jexport PROMPT_COMMAND="history -a; history -c; history -r;"

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

alias home='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias dl='cd ~/Downloads'
alias _='cd -'
alias met='cd /c/Users/ericb/metova/'
alias prog='cd /c/programs/'
alias yale='cd /c/Users/ericb/metova/yale-control4-proxy-driver'


# jquery in the console
# var script = document.createElement('script');script.src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js";document.getElementsByTagName('head')[0].appendChild(script); // jquery


# REMEMBER COMMANDS
alias sshkeyfix='echo "sed -i {LINENUMBERGIVENINERRMESSAGE}d ~/.ssh/known_hosts"'
alias gitoutofsync='echo "git reset --hard origin/master"'
alias findcom='echo "find ~ -name FILENAME (to search in ~)"'

#export CLICOLOR=1
#export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# GO
#jexport PATH=$PATH:/usr/local/go/bin:/Users/eb/go/bin
#export GOPATH=$HOME/go

# z 
# z is great! https://github.com/rupa/z/ 
#. ~/z.sh

# YOUTUBE-DL
alias ytdl='youtube-dl -i --force-ipv4 --extract-audio --audio-format mp3'

# POSTGRES
alias postgres1='pg_ctl -D /usr/local/var/postgres -l logfile start'

# java -jar ripme.jar - grab everything from reddit

# REFRESH curled webpage from devbox


echo 'happy :)'

