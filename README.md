# bash-profile

## Overall
This directory contains the scripts that are run as part of the .bashrc file.
All files are included in the proper order from all-tools.git/all.incl

## WARNINGS

These are expected to be sourced into another bash script that's run at shell startup.

The order of inclusion of these matters because the completion generation function MUST be after all other
definitions!

## USAGE
There are a number of configuration variables these scripts provide for the .bashrc to optionally
set before inclusion to customize the behavior of the scripts to a particular installation.
They are all based on whether the variables are set or unset when they are boolean.

| Name | Usage | Values | Depends on | Description |
|:-----|:-----:|:------:|:----------:|:------------|
| `MY_TOOLS_DIR` | Required | Path | | Path to the `all.incl` symlink in the repo above this. |
| `SUPPORT_REMOTE` | Choose | non-/blank | | If `screen` is installed, all shell sessions are run in a `screen` session.|
| `USE_EMACS` | Choose | non-/blank | | Configure `emacs` as the default editor for GUI and no-window editing. |
| `USE_GTAGS` | Choose | non-/blank |`USE_EMACS` | Use `gtags` alongside `emacs`. |
| `CURSOR_TYPE` | Choose | value/blank | | Set to `block`, `block_blink`, `underline`, `underline_blink`,<br>`bar`, or `bar_blink` to set the cursor at shell startup.<br>This may not stick if commands are run that change the cursor.|
| `color_prompt` | Choose | non-/blank | Ubuntu, bash | Should the fallback prompt be colored? |
| `use_color` | Choose | true/false | not-Ubuntu, bash | Should the prompt be colored? |
| `NO_REMOTE_WINDOW` | Choose | non-/blank | `SUPPORT_REMOTE` | In `screen`, remote connections should run in no-window mode.<br>Remote is detected by the DISPLAY settting not matching a localhost DISPLAY setting.|
| `NO_WINDOW` | Choose | non-/blank | `SUPPORT_REMOTE` | In `screen` run everything in no-window mode, regardless of remote vs local DISPLAY.|
| `SAVE_SCREEN_AUTH` | Choose | non-/blank | `SUPPORT_REMOTE` | In `screen`, in addition to autosaving DISPLAY, also autosave XAuth properties to allow for authenticated X11 forwarding.<br>`x11load` looks for and will use this as well.|
| `WIPE_SCREENS_ON_START` | Choose | non-/blank | `SUPPORT_REMOTE` | In `screen`, clean up all detached screen sessions on shell start.<br>Useful if screen sessions are created automatically by the terminal and remote connections are unlikely,<br>or only remote connections to active terminals are all that's desired.|
| `GTAGS_INSTALL_DIR` |  Choose | Path/blank | `USE_GTAGS` | In `emacs` `gtags`, the path the Global `gtags` was installed in if not already set in `PATH`.|
