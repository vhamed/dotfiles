# g++ compiler with opencv (I called it occ :) )
occ () {
    g++ $* $(pkg-config --libs opencv)
}

tmuxlistcolors () {
    for i in {0..255}; do
        printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"
    done
}

# wincent dotfiles
color () {
    BACKGROUND=$1
    SCHEME=$2

    if [ $# -eq 0 ]; then
        echo $BASE16_THEME | sed -E 's|base16-||' | sed -r 's|-dark| (dark)|' | sed -r 's|-light| (light)|'
        return
    fi

    if [[ $SCHEME == 'help' ]]; then
        BACKGROUND=help
    fi

    case $BACKGROUND in
        dark|light )
            echo hello $BACKGROUND
            FILE=$BASE16_SHELL"scripts/base16-"$SCHEME.sh
            if [[ -a $FILE ]]; then
                echo $SCHEME
                echo $BACKGROUND
            fi;
            ;;
        help )
            echo "color dark [ocean|solarized|...]"
            echo "color light [ocean|solarized|...]"
            echo 
            echo "Available Themes: "
            ls $HOME/.config/base16-shell/scripts | sed -r 's|base16-||' |  sed -r 's|.sh$||'
            ;;
        * )
            echo error
            ;;
    esac
}

# create dir and cd into it
mk () {
    mkdir -p $@ && cd $@
}

# download mp3 from youtube
mp3 () {
    youtube-dl --no-playlist -o "~/Music/%(title)s.%(ext)s" --extract-audio --audio-format mp3 "$1"
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

blue() { 
    tput setaf 4; echo $@; tput sgr0; 
}

# Laravel
a () {
    php artisan $@ 
}

ar () {
    php artisan $@ 
}

artisan () {
    php artisan $@ 
}

route:list () {
    php artisan route:list $@
}

# Git 
gl () {
    git log $@
}

glo () {
    git log --format=oneline $@
}

gs () {
    git status $@ 
}

co () {
    git checkout $@
}

stash () {
    git stash $@
}

whoeatmyram () {
    ps aux | awk '{print $6/1024 " MB\t\t" $11}' | sort -rn | head -25 
}
