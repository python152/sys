#!/bin/bash

DRIVE="DATA2"
SRC="$HOME/Pictures"
DEST="/Volumes/$DRIVE/Backups/Pictures"


### for better integrity 
### use --checksum option

cd ~


[ -d ${SRC} ] && {

    set -x

    for x in P2013 P2014 P2015 P2016 Lightroom Shared; do

        printf "Sync [$x]\n"
        rsync -a --size-only --delete --progress  --exclude=".*" \
            ${SRC}/$x/ $DEST/$x/

    done

} || {
    printf "Source or destination is not available\n"; exit 1
}

printf "Sync Books"

rsync -a --size-only --delete --progress  --exclude=".*" \
            ~/Documents/Books/ /Volumes/$DRIVE/Backups/Books/





