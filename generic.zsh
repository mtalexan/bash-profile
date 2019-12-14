HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory extendedglob nomatch notify complete_aliases listambiguous pushdignoredups noautomenu nomenucomplete histignoredups histignorealldups histsavenodups histverify sharehistory noflowcontrol
unsetopt autocd

# zsh-bd
source ${LOCAL_PROFILES_DIR}/tools/zsh-bd/bd.zsh

# peco history
# Requires manual installation of the peco executable from https://github.com/peco/peco/releases
export PATH=${LOCAL_PROFILES_DIR}/tools/peco_linux_amd64:${PATH}
# command-line options to peco when called
export ZSH_PECO_HISTORY_OPTS="--layout=bottom-up --initial-filter=SmartCase --select-1"
# set to non-zero to dedup history before sending to peco
export ZSH_PECO_HISTORY_DEDUP=1
source ${LOCAL_PROFILES_DIR}/tools/zsh-peco-history/zsh-peco-history.zsh

#fzf-fasd, allows selection of tab completion of the "z" command
source ${LOCAL_PROFILES_DIR}/tools/fzf-fasd/fzf-fasd.plugin.zsh

#up command
source ${LOCAL_PROFILES_DIR}/tools/up.zsh/up.plugin.zsh
