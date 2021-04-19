u () {
  sudo apt-get -y update
  apt list --upgradable
  read -q "REPLY?Do you want to update ?"
  echo    # move to a new line
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    sudo apt-get -y upgrade
  else
    echo "Don't worry, you can update later"
  fi
}

tmuxlistcolors () {
    for i in {0..255}; do
        printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"
    done
}

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

# download mp3 from youtube
mp3 () {
  youtube-dl --no-playlist -o "~/Music/%(title)s.%(ext)s" --extract-audio -x --audio-format mp3 "$1"
}

# mp3 playlist
mp3p (){
  youtube-dl --yes-playlist -o "~/Music/%(title)s.%(ext)s" --extract-audio --audio-format mp3 "$1"
}

# video
video (){
  youtube-dl --no-playlist -o "~/Videos/%(title)s.%(ext)s" "$1"
}

# video playlist
videop () {
  youtube-dl --yes-playlist -o "~/Videos/%(title)s.%(ext)s" "$1"
}

youtubeupdate () {
  pip install --upgrade youtube-dl
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

blue() { 
  tput setaf 4; echo $@; tput sgr0; 
}

artisan () {
  php artisan $@ 
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

git_change_author_info () {
  git filter-branch -f --env-filter "GIT_AUTHOR_NAME='Hamed Bensaad'; GIT_AUTHOR_EMAIL='freelancerlwjgl@gmail.com'; GIT_COMMITTER_NAME='Hamed Bensaad'; GIT_COMMITTER_EMAIL='freelancerlwjgl@gmail.com';" HEAD
}

backup () { 
  sudo rsync -aPv \
    --exclude '.tox' \
    --exclude 'node_modules' \
    --exclude 'Dropbox/' \
    --exclude 'Desktop/' \
    --exclude 'snap/' \
    --exclude '.cache' \
    --exclude '.config' \
    --exclude '.local' \
    --info=progress2 \
  /home/hamed/ /media/hamed/disk/files-backup
}

restore () {
  rsync --progress \
    /media/hamed/disk/files-backup /home/hamed
}

# update neovim
uv () {
  cd $REPOS/neovim
  git pull origin master
  sudo make CMAKE_BUILD_TYPE=Release && sudo make install
  cd -
}
