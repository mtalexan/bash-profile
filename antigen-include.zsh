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
antigen bundle zsh-users/zsh-autosuggestions

# Other bundles
antigen bundle djui/alias-tips
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle joel-porquet/zsh-dircolors-solarized.git

source ${LOCAL_PROFILES_DIR}/zsh-theme.zsh

# must be last
antigen apply
