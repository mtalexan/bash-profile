
# used for the pure theme instead of antigen theme
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

#antigen theme yarisgutierrez/classyTouch_oh-my-zsh

#antigen theme the0neWhoKnocks/zsh-theme-boom skin

#antigen theme ginfuru/zsh-blackrain

BENDER_THEME_STYLE=mini
#antigen theme specious/bender

export AGKOZAK_CUSTOM_SYMBOLS=( '⇣⇡' '⇣' '⇡' '+' 'x' '!' '>' '?' )
#antigen theme agkozak/agkozak-zsh-prompt

source ${LOCAL_PROFILES_DIR}/powerlevel10k.config
# hide 'context' segment when username matches this
DEFAULT_USER=aaravchen
#antigen theme romkatv/powerlevel10k

export SPACESHIP_EXEC_TIME_SHOW=false
# don't truncate any of the directories
export SPACESHIP_DIR_TRUNC=0
export SPACESHIP_BATTERY_SHOW=false
export SPACESHIP_EXIT_CODE_SHOW=true
#antigen theme denysdovhan/spaceship-prompt


export ALIEN_SECTIONS_LEFT=(
    venv
    path
    vcs_branch:async
    vcs_status:async
    vcs_dirty:async
    newline
)
export ALIEN_SECTIONS_RIGHT=(
    exit
)
export USE_NERD_FONT=1
#export ALIEN_THEME="blue"
#export ALIEN_THEME="green"
#export ALIEN_THEME="red"
#export ALIEN_THEME="soft"
export ALIEN_THEME="gruvbox"
#antigen theme eendroroy/alien

#antigen theme robbyrussell
