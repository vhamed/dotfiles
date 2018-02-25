# g++ compiler with opencv (I called it occ :) )
occ () {
    g++ $* $(pkg-config --libs opencv)
}

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
