# The following lines were added by compinstall

# set that was way too slow
#zstyle ':completion:*' completer _list _expand _complete _ignored _match
#zstyle ':completion:*' completions 1
#zstyle ':completion:*' glob 1
#zstyle ':completion:*' insert-unambiguous true
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
#zstyle ':completion:*' max-errors 1
#zstyle ':completion:*' menu select=long
#zstyle ':completion:*' preserve-prefix '//[^/]##/'
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#zstyle ':completion:*' substitute 1
#zstyle ':completion:*' use-compctl true
#zstyle :compinstall filename '/home/aaravchen/.zshrc'

# subset to keep
zstyle ':completion:*' completer _list _expand _complete _ignored _match
zstyle ':completion:*' completions 1
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' use-cache yes

autoload -U +X -z compinit && compinit

# Must be after antigen apply to override
# oh-my-zsh bindings

# Load the profile scripts
export GTAGS_INSTALL_DIR=/home/dev/global-6.5.6
export MY_TOOLS_DIR=/home/dev/my-tools
source ${MY_TOOLS_DIR}/all.incl
