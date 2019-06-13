# Basic generic settings.  Includes history size and settings,
# aliases for colorization, git status in the prompt, and user based process aliasing.
#
# Requires git 
# No arguments

# don't put duplicate lines in the history. See bash(1) or zsh for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1) or zsh
HISTSIZE=100000
HISTFILESIZE=200000

# append to the history file, don't overwrite it
shopt -s histappend

if uname -a | grep -iq "ubuntu" ; then
    source ${LOCAL_PROFILES_DIR}/prompt-ubuntu.bash
else
    source ${LOCAL_PROFILES_DIR}/prompt-manjaro.bash
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto '
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto '
    alias fgrep='fgrep --color=auto '
    alias egrep='egrep --color=auto '
fi

if uname -a | grep -iq "ubuntu" ; then
    #force parsing of the correct .Xdefaults file since Ubuntu apparently
    #dislikes doing it
    xrdb ~/.Xdefaults
fi



