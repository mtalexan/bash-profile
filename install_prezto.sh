#!/bin/bash

SCRIPT_DIR=$(dirname ${BASH_SOURCE[0]})

if [ -d ${HOME}/.zprezto ] ; then
    echo "Already cloned, skipping"
# clone from a variant location that fixes always seeing Ruby settings
elif ! git clone https://github.com/chauncey-garrett/zsh-prezto  ${HOME}/.zprezto ; then
    echo "ERROR during cloning"
    exit 1
fi

# Copy the template if we don't have one already
if [ -e ${HOME}/.zshrc ] ; then
    echo "~/.zshrc already exists, skipping"
else
    if ! cp ${SCRIPT_DIR}/zshrc ${HOME}/.zshrc ; then
        echo "Error copying .zshrc"
        exit 1
    else
        echo "Copied template .zshrc to ${HOME}"
    fi
fi

# setup the symlinks

# zprezto comes from this location
if [ -e ${HOME}/.zprezto ] ; then
    echo "~/.zprezto already exists, skipping"
elif ! ln -sr ${SCRIPT_DIR}/zprezto ${HOME}/.zprezto ; then
    echo "ERROR symlinking .zprezto"
    exit 1
fi

# the others all come from .zprezto/runcoms
for F in zlogin zlogout zprofile zshenv ; do
    if [ -e ${HOME}/.${F} ] ; then
        echo "Already existing .${F}, skipping"
    elif ! ln -sr ${HOME}/.zprezto/runcoms/${F} ${HOME}/.${F} ; then
        echo "ERROR symlinking .${F}"
        exit 1
    fi
done

# Setup the garrett theme
TEMPDIR=${HOME}/garret-prompt-${RANDOM}


if [ ! -e ${HOME}/.zprezto/modules/prompt/functions/prompt_garrett_setup ] ; then
    if ! git clone https://github.com/chauncey-garrett/zsh-prompt-garrett ${TEMPDIR} ; then
        echo "ERROR couldn't clone prompt repo"
        exit 1
    fi

    if ! cp ${TEMPDIR}/prompt_garrett_setup ${HOME}/.zprezto/modules/prompt/functions/ ; then
        echo "ERROR couldn't copy prompt_garrett_setup to zprezto location"
        exit 1
    fi

    if ! rm -r ${TEMPDIR} ; then
        echo "ERROR couldn't cleanup ${TEMPDIR}, do it manually"
    fi

    echo "Make sure to set the theme to 'garrett' in the .zprezto file ad change the plugin order"
fi
