# It seems antigen screws these things up, so reload the completion functions if necessary
autoload -U +X -z compinit && compinit
# allow bash-style completion to be parsed as well
autoload -U +X bashcompinit && bashcompinit
