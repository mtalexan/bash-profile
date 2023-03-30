# this sets up basic completion and should come early in the loading.

zstyle ':completion:*' completer _list _expand _complete _ignored _match
zstyle ':completion:*' completions 1
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' use-cache yes

