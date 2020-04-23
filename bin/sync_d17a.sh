#!/bin/bash

cd ~

SRC="/Volumes/D17A"
TO="/Volumes/D15A"

[ -d ${SRC} ] && {

    set -x

    for x in History KidsMovies Misc Movies TVShows 中文电影; do

        printf "Sync [D17AB/$x]\n"
        rsync -a --size-only --delete --progress  --exclude=".*" \
            ${SRC}/$x/ ${TO}/$x/

    done

} || {
    printf "Source or destination is not available\n"; exit 1
}





