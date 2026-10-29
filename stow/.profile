# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

export EDITOR=nvim
export VISUAL=nvim
export TERMINAL=kitty
export REPOS=$HOME/Repos
export DOTFILES=$REPOS/dotfiles

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal

# export NODE_OPTIONS="--max-old-space-size=8192"
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.opencode/bin" ] ; then
    PATH="$HOME/.opencode/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}"/pass
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}"/gnupg
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}"/sh/history
export LESSKEY="${XDG_DATA_HOME:-$HOME/.local/share}"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
# ZSH
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}"/zsh

# Private, untracked overrides (secrets, machine-specific env)
if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/sh/.profile-private" ]; then . "${XDG_CONFIG_HOME:-$HOME/.config}/sh/.profile-private"; fi

