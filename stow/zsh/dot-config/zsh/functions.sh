# Determine size of a file or total size of a directory
fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		du $arg .[^.]* ./*;
	fi;
}

# `o` with no arguments opens the current directory, otherwise opens the given
# location
o() {
	if [ $# -eq 0 ]; then
		gio open .;
	else
		gio open "$@";
	fi;
}

# create dir and cd into it
mk () {
  mkdir -p $@ && cd $@
}

aptUnlock () {
  sudo rm /var/lib/apt/lists/lock
  sudo rm /var/cache/apt/archives/lock
  sudo rm /var/lib/dpkg/lock
}

aptUnlock2 () {
  sudo apt clean
  sudo rm -rf /var/lib/apt/lists/*
  sudo apt clean
}

# Git 
gl () {
  git log $@
}

gs () {
  git status $@ 
}

gt () {
  git stats
}

gd () {
  git diff $@
}

whoeatmyram () {
  ps aux | awk '{print $6/1024 " MB\t\t" $11}' | sort -rn | head -25 
}
