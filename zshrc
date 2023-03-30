#####
# This file is a template and should not be used directly.
#####


## Set the default user so prompts will know when you're running as a different user
export DEFAULT_USER="myself"

# Use emacs as the default editor (must be installed)
#export USE_EMACS=true

# Use gtags with emacs?
#export USE_GTAGS=true
## Path containing a bin folder with gtags in it, if it's not already in the PATH
#export GTAGS_INSTALL_DIR=${HOME}/global-6.5.6

# Run every terminal in a 'screen' session so it can be grabbed from a remote
# session too? (only works for x11)
#export SUPPORT_REMOTE=true

#################################################################################
#  Prezto must be installed using the ${MY_TOOLS_DIR}/profile/install_prezto.sh
#  if running zshell
#################################################################################

export MY_TOOLS_DIR=${HOME}/my-tools
source ${MY_TOOLS_DIR}/all.incl

# Remove these lines entirely to be prompted for configuration of each part
# of the prompt on startup, which will generate the config file and offer
# to put these lines in for it. 
#
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -e ~/.p10k.zsh ]] || source ~/.p10k.zsh
