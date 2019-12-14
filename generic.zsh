HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory extendedglob nomatch notify complete_aliases listambiguous pushdignoredups noautomenu nomenucomplete histignoredups histignorealldups histsavenodups histverify sharehistory noflowcontrol
unsetopt autocd

# load the zplugins
source ${LOCAL_PROFILES_DIR}/zplug.incl
