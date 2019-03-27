# Set up the prompt

# autoload -Uz promptinit
# promptinit
# prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
HISTFILESIZE=2000
SAVEHIST=1000
HISTFILE=~/.zsh_history
HISTIGNORE="ls:cd *:cd:cd ~:l:pwd:exit:date:* --help";
MUSIC=$HOME/Music;
EDITOR="vim";
editor="vim";
REPOS=$HOME/Repos;
DOTFILES=$REPOS/dotfiles;

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

setopt autocd 
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

source $HOME/.zsh/aliases.sh
source $HOME/.zsh/functions.sh 


#
# Prompt
#


autoload -U colors
colors


# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html
autoload -Uz vcs_info
precmd (){ vcs_info }
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "%F{green}● %f" # default 'S'
zstyle ':vcs_info:*' unstagedstr "%F{red}● %f" # default 'U'
zstyle ':vcs_info:*' use-simple true
zstyle ':vcs_info:git+set-message:*' hooks git-untracked
zstyle ':vcs_info:git*:*' formats '[%b%m%c%u] ' # default ' (%s)-[%b]%c%u-'
zstyle ':vcs_info:git*:*' actionformats '[%b|%a%m%c%u] ' # default ' (%s)-[%b|%a]%c%u-'
zstyle ':vcs_info:hg*:*' formats '[%m%b] '
zstyle ':vcs_info:hg*:*' actionformats '[%b|%a%m] '
zstyle ':vcs_info:hg*:*' branchformat '%b'
zstyle ':vcs_info:hg*:*' get-bookmarks true
zstyle ':vcs_info:hg*:*' get-revision true
zstyle ':vcs_info:hg*:*' get-mq false
zstyle ':vcs_info:hg*+gen-hg-bookmark-string:*' hooks hg-bookmarks
zstyle ':vcs_info:hg*+set-message:*' hooks hg-message


function +vi-hg-bookmarks() {
  emulate -L zsh
  if [[ -n "${hook_com[hg-active-bookmark]}" ]]; then
    hook_com[hg-bookmark-string]="${(Mj:,:)@}"
    ret=1
  fi
}


function +vi-hg-message() {
  emulate -L zsh


# Suppress hg branch display if we can display a bookmark instead.
  if [[ -n "${hook_com[misc]}" ]]; then
    hook_com[branch]=''
  fi
  return 0
}


function +vi-git-untracked() {
  emulate -L zsh
  if [[ -n $(git ls-files --exclude-standard --others 2> /dev/null) ]]; then
    hook_com[unstaged]+="%F{blue}● %f"
  fi
}


RPROMPT_BASE="\${vcs_info_msg_0_}%F{blue}%~%f"
setopt PROMPT_SUBST


# Anonymous function to avoid leaking NBSP variable.
function () {
  if [[ -n "$TMUX" ]]; then
    local LVL=$(($SHLVL - 1))
  else
    local LVL=$SHLVL
  fi
  if [[ $EUID -eq 0 ]]; then
    local SUFFIX=$(printf '#%.0s' {1..$LVL})
  else
    local SUFFIX=$(printf '\$%.0s' {1..$LVL})
  fi
  if [[ -n "$TMUX" ]]; then
    # Note use a non-breaking space at the end of the prompt because we can use it as
    # a find pattern to jump back in tmux.
    local NBSP=' '
    export PS1="%F{green}${SSH_TTY:+%n@%m}%f%B${SSH_TTY:+:}%b%F{blue}%1~%F{yellow}%B%(1j.*.)%(?..!)%b%f%F{red}%B${SUFFIX}%b%f${NBSP}"
    export ZLE_RPROMPT_INDENT=0
  else
    # Don't bother with ZLE_RPROMPT_INDENT here, because it ends up eating the
    # space after PS1.
    export PS1="%F{green}${SSH_TTY:+%n@%m}%f%B${SSH_TTY:+:}%b%F{blue}%1~%F{yellow}%B%(1j.*.)%(?..!)%b%f%F{red}%B${SUFFIX}%b%f "
  fi
}


export RPROMPT=$RPROMPT_BASE
export SPROMPT="zsh: correct %F{red}'%R'%f to %F{red}'%r'%f [%B%Uy%u%bes, %B%Un%u%bo, %B%Ue%u%bdit, %B%Ua%u%bbort]? "

export PATH=$HOME/.config/composer/vendor/bin:$PATH
eval $(dircolors ~/.dir_colors)
# man xkeyboard-config 

export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
