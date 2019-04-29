#####
# This file is a template and should not be used directly.
#####


## Set the default user so prompts will know when you're running as a different user
#export DEFAULT_USER="myself"

## Path containin a bin folder with gtags in it, if it's not already in the PATH
#export GTAGS_INSTALL_DIR=${HOME}/global-6.5.6

## Force custom emacs daemon definitions. Conflicts with oh-my-zsh emacs package.
## Auto-enabled for bash on Ubuntu
#export EMACS_USE_DAEMON=true

export MY_TOOLS_DIR=${HOME}/my-tools
source ${MY_TOOLS_DIR}/all.incl
