if [ -e /usr/share/zsh/share/antigen.zsh ] ; then
    # Manjaro
    source /usr/share/zsh/share/antigen.zsh
elif [ -e ${LOCAL_PROFILES_DIR}/antigen.zsh ] ; then
    # Ubuntu is absurdly old, don't use the apt-get version
    source ${LOCAL_PROFILES_DIR}/antigen.zsh
else
    echo "ERROR: Missing antigen"
    exit 1
fi

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

#generic settings
CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

# oh-my-zsh bundles
antigen bundle gitfast
antigen bundle pip
antigen bundle colored-man-pages
antigen bundle colorize
antigen bundle emacs
antigen bundle git-extras
antigen bundle ripgrep
antigen bundle urltools
antigen bundle zsh-navigation-tools

# zsh-users bundles
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

ZSH_AUTOSUGGEST_STRATEGY=(history)
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'
antigen bundle zsh-users/zsh-autosuggestions

# Other bundles
antigen bundle djui/alias-tips
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle joel-porquet/zsh-dircolors-solarized.git

# Theme setting
source ${LOCAL_PROFILES_DIR}/zsh-theme.zsh

# must be last
antigen apply

############################################################
#                  WARNING
############################################################
## If you get the following errors after an antigen bundle is installed:
##
##    zsh compinit: insecure directories, run compaudit for list.
##    Ignore insecure directories and continue [y] or abort compinit [n]? 
##
## It's because the compinit command checks to ensure files it scans are
## only writeable by the current user or root.  `compaudit' lists the files
## that are problematic.
## To correct them all automatically by removing the insecure write permissions
## run the following command:
##
##    compaudit 2>&1 | tail +2 | xargs -I{} chmod go-w {}
##
############################################################
############################################################
