#!/bin/bash

###
### Note: 中文电视1 is moved from D12B to D11A. D11A is fairly static
### and I don't expect this to change much, so it is NOT synced to 
### data.local/D11A anymore
 

TO="f7b@data.local"
### for better integrity 
### use --checksum option

cd ~

SRC="/Volumes/D12B"

[ -d ${SRC} ] && {

    set -x

    for x in TVShows Anime Movies 中文电视2; do

        printf "Sync [D12B/$x]\n"
        rsync -a --size-only --delete --progress  --exclude=".*" \
            -e ssh ${SRC}/$x/ ${TO}:/Volumes/D15A/$x/

    done

    for x in 中文电影 Documentary 音乐教程 琪琪音乐课 琪琪电视 综艺娱乐; do 
        echo "Sync [D12B/$x]\n"
        # add --delete?
        rsync -a --size-only --progress --delete \
            -e ssh ${SRC}/$x/ ${TO}:/Volumes/D11A/$x/
    done


} || {
    printf "Source or destination is not available\n"; exit 1
}





