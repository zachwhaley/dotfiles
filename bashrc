# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
export TERM=xterm-256color

# Color definitions
txtblk='\[\033[00;30m\]' # Black - Regular
txtred='\[\033[00;31m\]' # Red
txtgrn='\[\033[00;32m\]' # Green
txtylw='\[\033[00;33m\]' # Yellow
txtblu='\[\033[00;34m\]' # Blue
txtpur='\[\033[00;35m\]' # Purple
txtcyn='\[\033[00;36m\]' # Cyan
txtwht='\[\033[00;37m\]' # White
bldblk='\[\033[01;30m\]' # Black - Bold
bldred='\[\033[01;31m\]' # Red
bldgrn='\[\033[01;32m\]' # Green
bldylw='\[\033[01;33m\]' # Yellow
bldblu='\[\033[01;34m\]' # Blue
bldpur='\[\033[01;35m\]' # Purple
bldcyn='\[\033[01;36m\]' # Cyan
bldwht='\[\033[01;37m\]' # White
unkblk='\[\033[04;30m\]' # Black - Underline
undred='\[\033[04;31m\]' # Red
undgrn='\[\033[04;32m\]' # Green
undylw='\[\033[04;33m\]' # Yellow
undblu='\[\033[04;34m\]' # Blue
undpur='\[\033[04;35m\]' # Purple
undcyn='\[\033[04;36m\]' # Cyan
undwht='\[\033[04;37m\]' # White
bakblk='\[\033[40m\]'    # Black - Background
bakred='\[\033[41m\]'    # Red
bakgrn='\[\033[42m\]'    # Green
bakylw='\[\033[43m\]'    # Yellow
bakblu='\[\033[44m\]'    # Blue
bakpur='\[\033[45m\]'    # Purple
bakcyn='\[\033[46m\]'    # Cyan
bakwht='\[\033[47m\]'    # White
txtrst='\[\033[0m\]'     # Text Reset

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

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

PS1="${bldylw}[$txtblu\w${bldylw}]\n${txtrst}\u ${txtgrn}$ ${txtrst}"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Cisco things
if [ -f ~/.ciscorc ]; then
    . ~/.ciscorc
fi

# Mac OSX things
if [ -f ~/.macosxrc ]; then
    . ~/.macosxrc
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

# Android Studio
export JAVA_HOME=/usr/java/latest
export ANDROID_HOME=/opt/android-studio/sdk
PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Perforce
export P4CONFIG=.p4config
export P4IGNORE=.p4ignore
export P4EDITOR=vim
export P4DIFF=vimdiff

export PATH
