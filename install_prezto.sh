#!/bin/bash
# Files needed in the directory with this script:
#  zshrc
#  zprestorc
# Files optionally in the directory with this script:
#  zlogin
#  zlogout
#  zprofile
#  zshenv


SCRIPT_DIR=$(dirname ${BASH_SOURCE[0]})

if [ -d "${HOME}/.zprezto" ] ; then
    echo "Already cloned, skipping"
# clone from a variant location that fixes always seeing Ruby settings
elif ! git clone --recurse-submodules --remote-submodules https://github.com/chauncey-garrett/zsh-prezto  "${HOME}/.zprezto" ; then
    echo "ERROR during cloning"
    exit 1
fi

# the chauncey-garret maintainer of the garrett prompt no longer guarantees his custom prompt is integrated,
# so check to see if it needs to be added manually
if ! [ -d "${HOME}/.zprezto/modules/prompt/external/garrett" ] ; then
    if ! git -C "${HOME}/.zprezto" submodule add https://github.com/chauncey-garrett/zsh-prompt-garrett.git modules/prompt/external/garrett ; then
        echo "ERROR during cloning of garrett prompt submodule"
        exit 1
    elif ! git -C "${HOME}/.zprezto" submodule update --init --recursive; then
        echo "ERROR during check for submodule updates during garret prompt install"
        exit 1
    fi
fi
# make sure the prompt theme is installed in the proper place to be used
if ! [ -e "${HOME}/.zprezto/modules/prompt/functions/prompt_garrett_setup" ] ; then
    if ! ln -sr "${HOME}/.zprezto/modules/prompt/external/garrett/prompt_garrett_setup" "${HOME}/.zprezto/modules/prompt/functions/prompt_garrett_setup" ; then
        echo "ERROR during symlinking of garrett prompt setup script"
        exit 1
    fi
fi

# Copy the template if we don't have one already
if [ -e "${HOME}/.zshrc" ] ; then
    echo "~/.zshrc already exists, skipping"
else
    if ! cp "${SCRIPT_DIR}/zshrc" "${HOME}/.zshrc" ; then
        echo "Error copying .zshrc"
        exit 1
    else
        echo "Copied template .zshrc to ${HOME}"
    fi
fi

# setup the symlinks

# zpreztorc comes from this location
if [ -e "${HOME}/.zpreztorc" ] ; then
    echo "~/.zpreztorc already exists, skipping"
elif ! ln -sr "${SCRIPT_DIR}/zpreztorc" "${HOME}/.zpreztorc" ; then
    echo "ERROR symlinking .zpreztorc"
    exit 1
fi

# the others all come from .zprezto/runcoms
for F in zlogin zlogout zprofile zshenv ; do
    if [ -e "${HOME}/.${F}" ] ; then
        echo "Already existing .${F}, skipping"
    elif ! ln -sr "${HOME}/.zprezto/runcoms/${F}" "${HOME}/.${F}" ; then
        echo "ERROR symlinking .${F}"
        exit 1
    fi
done

# Garrett prompt is already integrated as an external theme

# Config for powerlevel10k prompt needs to be symlinked
ln -sr ${SCRIPT_DIR}/p10k_config.zsh ${HOME}/p10k_config.zsh
