if ! command -v gawk &>/dev/null ; then
   echo >&2 "ERROR: need to install gawk for zplug to work without producing \"Unknown Error\" for each repo"
else
    # zplug
    export ZPLUG_HOME="${LOCAL_PROFILES_DIR}/tools/zplug"
    source "${ZPLUG_HOME}/init.zsh"

    ###################################################
    # WARNING WARNING WARNING WARNING WARNING WARNING
    #
    # Any changes to existing plugins requires running these commands:
    #  zplug clear
    #  zplug clean --force
    #  sudo rm -r ${MY_TOOLS_DIR:?}/profile/tools/zplug/repos/*
    #  git -C ${MY_TOOLS_DIR:?}/profile/tools/zplug reset --hard
    # And then re-opening the terminal and waiting for the 
    # re-install and re-load.
    #
    # WARNING WARNING WARNING WARNING WARNING WARNING
    ###################################################


    # let zplug manage itself
    zplug 'zplug/zplug', hook-build:'zplug --self-manage'

    # This not only doesn't work, it corrupts all other plugins by wiping out everything else.
    ## Grab binaries from GitHub Releases
    #zplug "junegunn/fzf", \
    #    from:gh-r, \
    #    as:command, \
    #    use:"*linux_amd64*"

    # Support oh-my-zsh plugins and prezto plugins
    zplug "plugins/git",   from:oh-my-zsh
    zplug "modules/prompt", from:prezto

    # Already included by modules/prompt,from:prezto.  Including it a second time causes an infinite hang
    # during loading.
    ## a tool for other tools to run asynchronous commands
    #zplug "mafredri/zsh-async", from:"github", use:"async.zsh", lazy:true

    # bd command for going up to a specific directory
    zplug "Tarrasch/zsh-bd", from:"github", use:"bd.zsh"

    #up command
    zplug "peterhurford/up.zsh", from:oh-my-zsh

    # content search in directory with fuzzy match
    #Key bound to Ctrl+f
    export FZF_DEFAULT_OPTS='--layout=default --bind="alt-bs:backward-kill-word,alt-j:backward-char,alt-l:forward-char,alt-i:up,alt-k:down,ctrl-j:backward-word,ctrl-l:forward-word,ctrl-i:page-up,ctrl-k:page-down,ctrl-g:cancel,alt-u:beginning-of-line,alt-o:end-of-line,ctrl-n:next-history,ctrl-p:previous-history,ctrl-]:jump,alt-space:toggle-in,ctrl-space:toggle-in" --multi'
    zplug "seletskiy/zsh-fuzzy-search-and-edit", lazy:false
    zstyle ':fuzzy-search-and-edit:editor' use-visual yes

    # forgit, an interactive git plugin
    # uses the FZF_DEFAULT_OPTS also
    #zplug 'wfxr/forgit'

    #fzf-fasd, allows selection of tab completion of the "z" command
    zplug "wookayin/fzf-fasd", lazy:false

    # zaw
    # history bound to Ctrl+r
    # git-branch to Alt+g b
    # git-log to Alt+g l
    # fasd to Alt+h
    # prompt for backend first is Ctrl+t
    # This tries to load lazily if we don't explicitly tell it not to.  But we need it to be loaded for the keybindings to work or trigger it
    zplug "zsh-users/zaw", lazy:false
    # also see keys.config for some zaw-specific keybindings and plugin checking

        # limit zaw to 7 lines
        zstyle ':filter-select' max-lines 7
        # advanced start/end of line matching and NOT syntax
        zstyle ':filter-select' extended-search yes
        zstyle ':filter-select' hist-find-no-dups yes
        #zstyle ':filter-select' escape-descriptions yes # literal newlines and not \n

        # set default and alt actions for different widget types
        zstyle ':zaw:git-files' default zaw-callback-append-to-buffer
        zstyle ':zaw:git-files' alt zaw-callback-edit-file
        zstyle ':zaw:git-files-legacy' default zaw-callback-append-to-buffer
        zstyle ':zaw:git-files-legacy' alt zaw-callback-edit-file
        zstyle ':zaw:git-branches' default zaw-callback-append-to-buffer
        zstyle ':zaw:git-recent-all-branches' default zaw-callback-append-to-buffer
        zstyle ':zaw:git-recent-branches' default zaw-callback-append-to-buffer
        zstyle ':zaw:git-log' default zaw-callback-append-to-buffer
        zstyle ':zaw:git-reflog' default zaw-callback-append-to-buffer
        #zstyle ':zaw:git-status' default zaw-callback-append-to-buffer # apparently not possible
        zstyle ':zaw:process' default zaw-callback-append-to-buffer
        zstyle ':zaw:fasd' default zaw-callback-append-to-buffer
        zstyle ':zaw:fasd-directories' default zaw-callback-append-to-buffer
        zstyle ':zaw:fasd-files' default zaw-callback-append-to-buffer

    # peco history search (zaw is better)
    # command-line options to peco when called
    #export ZSH_PECO_HISTORY_OPTS="--layout=bottom-up --initial-filter=SmartCase --select-1"
    ## set to non-zero to dedup history before sending to peco
    #export ZSH_PECO_HISTORY_DEDUP=1
    #zplug "jimeh/zsh-peco-history", defer:2

    show_verbose=""
    # put this after all zplug definitions to auto install on startup
    if ! zplug check ; then
        # auto-install the plugins that are needed
        zplug install
        if [ $? -ne 0 ]; then
            echo >&2 "Error installing zplug plugins!"
        fi
        echo "Zplug is self-managing so it can take a very long time to load the first time after install (30+ seconds)."
        # set this so we show the real-time loading
        show_verbose="--verbose"
    fi

    # add --verbose for debugging. Must be last
    zplug load ${show_verbose}
    if [ $? -ne 0 ] ; then
        echo >&2 "ERROR loading zplug plugins!"
    fi
    unset show_verbose
fi