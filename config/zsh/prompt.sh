fpath=($fpath "/home/hamed/.zfunctions")

SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  # hg            # Mercurial section (hg_branch  + hg_status)
  # package       # Package version
  # gradle        # Gradle section
  # maven         # Maven section
  node          # Node.js section
  # ruby          # Ruby section
  # elixir        # Elixir section
  # xcode         # Xcode section
  # swift         # Swift section
  # golang        # Go section
  # php           # PHP section
  # rust          # Rust section
  # haskell       # Haskell Stack section
  # julia         # Julia section
  # docker        # Docker section
  # aws           # Amazon Web Services section
  # gcloud        # Google Cloud Platform section
  # venv          # virtualenv section
  # conda         # conda virtualenv section
  # pyenv         # Pyenv section
  # dotnet        # .NET section
  # ember         # Ember.js section
  # kubectl       # Kubectl context section
  # terraform     # Terraform workspace section
  # line_sep      # Line break
  # jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_RPROMPT_ORDER=(
  exec_time     # Execution time
  git           # Git section (git_branch + git_status)
  # battery       # Battery level and status
  # line_sep      # Line break
  # vi_mode       # Vi-mode indicator
)
SPACESHIP_PROMPT_ADD_NEWLINE=false	
SPACESHIP_BATTERY_SHOW=always

SPACESHIP_GIT_BRANCH_SUFFIX=" "		

# RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE
#
SPACESHIP_GIT_STATUS_PREFIX="%F{white}[ "	# Prefix before Git status subsection
SPACESHIP_GIT_STATUS_SUFFIX="%F{white}]"	# Prefix before Git status subsection

SPACESHIP_GIT_STATUS_UNTRACKED="%F{blue}● %f"	# Indicator for untracked changes
SPACESHIP_GIT_STATUS_MODIFIED="%F{red}● %f" # Indicator for unstaged files
SPACESHIP_GIT_STATUS_ADDED="%F{green}● %f"	# Indicator for added changes

SPACESHIP_GIT_STATUS_RENAMED="%F{red}凜 "	# Indicator for renamed files
SPACESHIP_GIT_STATUS_DELETED="%F{red} " 	# Indicator for deleted files
SPACESHIP_GIT_STATUS_STASHED=""	# Indicator for stashed changes
SPACESHIP_GIT_STATUS_UNMERGED=""	# Indicator for unmerged changes
SPACESHIP_GIT_STATUS_AHEAD="%F{yellow}⇡ "	# Indicator for unpushed changes (ahead of remote branch)
SPACESHIP_GIT_STATUS_BEHIND="%F{yellow}⇣ "	# Indicator for unpulled changes (behind of remote branch)


# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship
