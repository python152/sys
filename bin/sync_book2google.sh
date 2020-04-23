#!/bin/bash

SRC="$HOME/Documents/Books/"
DST="/Volumes/GoogleDrive/My Drive/FYW/Books/"

[ -d "${SRC}" ] || {
    echo "Can't locate $SRC"
    exit 1
}

if [ -d "${DST}" ]; then 
    echo "Syncing: $SRC --> $DST"
    rsync -a --exclude="Icon?" --exclude=.DS_Store --progress --delete "${SRC}" "${DST}"
else
    echo "Can't locate $DST"
    exit 1
fi

