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

# add the git settings to the command prompt
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\w\[\033[00m\]\[\033[1;33m\]$(__git_ps1)\[\033[00m\] \$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\w$(__git_ps1) \$ '
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

#force parsing of the correct .Xdefaults file since Ubuntu apparently
#dislikes doing it
xrdb ~/.Xdefaults



