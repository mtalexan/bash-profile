# enables the powerline-go
function _update_ps1() {
    local POWERLINE_OPTIONS=()
    POWERLINE_OPTIONS+=(-condensed)
    POWERLINE_OPTIONS+=(-mode "patched")
    POWERLINE_OPTIONS+=(-modules cwd,git,hg,svn,newline,root,ssh,venv,vgo,perlbrew,exit)
    POWERLINE_OPTIONS+=(-numeric-exit-codes)
    POWERLINE_OPTIONS+=(-cwd-mode "plain")
    POWERLINE_OPTIONS+=(-cwd-max-depth -1)
    POWERLINE_OPTIONS+=(-colorize-hostname)
    PS1="$(powerline-go-linux-amd64 -error $? ${POWERLINE_OPTIONS[@]})"
}

export PATH=${LOCAL_PROFILES_DIR}/tools:${PATH}
if [ "$TERM" != "linux" ] && command -v powerline-go-linux-amd64 &>/dev/null ; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

