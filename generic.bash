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

# append to the history file, don't overwrite it.
shopt -s histappend

if uname -a | grep -iq "ubuntu" ; then
    source "${LOCAL_PROFILES_DIR}/prompt-ubuntu.bash"
else
    source "${LOCAL_PROFILES_DIR}/prompt-manjaro.bash"
fi


