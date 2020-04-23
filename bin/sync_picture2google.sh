#!/bin/bash

SRC="$HOME/Pictures/"
DST="/Volumes/GoogleDrive/My Drive/Family Pictures/"
FLAGS="-a --exclude='.fseventsd*' --exclude='Icon?' --exclude=.DS_Store --exclude='.Spotlight*' --exclude=.Trashes --progress"
[ -d "${SRC}" ] || {
    echo "Can't locate $SRC"
    exit 1
}

if [ -d "${DST}" ]; then 
    echo "Syncing: $SRC --> $DST"
    #rsync -a --exclude="Icon?" --exclude=.DS_Store --progress --delete "${SRC}" "${DST}"
    rsync "${FLAGS}" --delete "${SRC}" "{DST}" 
else
    echo "Can't locate $DST"
    exit 1
fi

#rsync -a --progress --size-only --delete ~/Desktop/FY_Musics/   \
#        /Volumes/D15_A1_128G/FY_Musics

