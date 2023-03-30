if [ -n "$USE_POWERLINE" ] && [ $USE_POWERLINE -eq 1 ] ; then
    source "${LOCAL_PROFILES_DIR}/powerline.bash"
else
    # add the git settings to the command prompt
    if [ "${color_prompt}" = yes ]; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\w\[\033[00m\]\[\033[1;33m\]$(__git_ps1)\[\033[00m\] \$ '
    else
        PS1='${debian_chroot:+($debian_chroot)}\w$(__git_ps1) \$ '
    fi
fi
