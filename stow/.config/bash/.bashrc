# Bash configuration file

## Exit for non-interactive shells (allow rsync to copy successfully)
case $- in
    *i*) ;;
    *) return;;
esac

# Use vi keybindings
set -o vi 

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;
shopt -s nullglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

source $XDG_CONFIG_HOME/sh/alias
source $XDG_CONFIG_HOME/bash/prompt

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
	# Ensure existing Homebrew v1 completions continue to work
	export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d";
	source "$(brew --prefix)/etc/profile.d/bash_completion.sh";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Private, untracked overrides
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/sh/.sh-private" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/sh/.sh-private"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/bash/.bashrc-private" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/bash/.bashrc-private"


# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null; then
	complete -o default -o nospace -F _git g;
fi;
