# set the prompt
if ${use_color} ; then
    if [[ ${EUID} == 0 ]] ; then
        # show red root@ when running as root
		PS1='\[\033[01;31m\][\u@\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
	else
		PS1='\[\033[01;32m\][\[\033[01;37m\]\W\[\033[00m\]\[\033[1;33m\]$(__git_ps1)\[\033[00m\]\[\033[01;32m\]]\$\[\033[00m\] '
	fi
else
    if [[ ${EUID} == 0 ]] ; then
        # show root@ when we're running as root
		PS1='\u@\h \W \$ '
	else
		PS1='[\w$(__git_ps1)]\$ '
	fi
fi
