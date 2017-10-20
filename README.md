# bash-profile

## Overall
This directory contains the scripts that are run as part of the .bashrc file.
All files are included in the proper order from all-tools.git/all.incl

## WARNINGS

These are expected to be sourced into another bash script that's run at shell startup.

The order of inclusion of these matters because the completion generation function MUST be after all other
definitions!

A common variable used by many of these scripts is LOCAL_CONFIG_DIR.  This is expected to be set to 
the directory this repo clone is located in since we can't determine that information otherwise.

## USAGE
There are a number of configuration variables these scripts provide for the .bashrc to optionally
set before inclusion to customize the behavior of the scripts to a particular installation.
They are all based on whether the variables are set or unset when they are boolean.

NO_REMOTE_WINDOW : In screen, boolean, remote connections should run in no-window mode. Remote is detected
                    by the DISPLAY settting not matching a localhost DISPLAY setting.
NO_WINDOW : In screen, boolean, run everything in no-window mode, regardless of remote vs. local DISPLAY.
SAVE_SCREEN_AUTH : In screen, boolean, in addition to autosaving DISPLAY, also autosave XAuth properties to allow
                   for authenticated X11 forwarding. x11load looks for and will use this as well.
WIPE_SCREENS_ON_START : In screen, boolean, clean up all detached screen sessions on shell start.  Useful if
                        screen sessions are created automatically by the terminal and remote connections are
                        unlikely, or remote connections to active terminals only are all that's desired.
GTAGS_INSTALL_DIR : In emacs_gtags, path, path the Global gtags was installed in.  If unset, /usr/local
                    is assumed. Useful for installs where the system as a whole should be minimally impacted.
               
                    
