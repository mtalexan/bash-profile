  # It seems antigen screws these things up, so force reload the completion functions if necessary
  autoload -U +X -z compinit && compinit
  # don't override it on autoload if it's already defined
  autoload -U +X bashcompinit && bashcompinit

  zstyle ':completion:*' completer _list _expand _complete _ignored _match
  zstyle ':completion:*' completions 1
  zstyle ':completion:*' insert-unambiguous true
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
  zstyle ':completion:*' preserve-prefix '//[^/]##/'
  zstyle ':completion:*' use-cache yes
