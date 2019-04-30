# This requires cloning Prezto to .zprezto, then symlinking everything from .zprezto/runcoms/ to ${ZDOTDIR:-$HOME}
# as dot files, except zshrc and zpreztorc.  The zpreztorc should be
# copied as a template file if it doesn't already exist

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
