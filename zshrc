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

# load powerlevel10k prompt
# if we throw any errors from this .zshrc with p10k active, it will go into config mode
# automatically and hide the errors.
if [[ -n "$(readlink -e "${HOME}/.p10k.zsh")" ]] && [[  -f "$(readlink -e "${HOME}/.p10k.zsh")" ]]; then
  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  source "${HOME}/.p10k.zsh"
  # force block config mode, it should never error out, and any errors we do get aren't
  # related to p10k
  POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
fi
