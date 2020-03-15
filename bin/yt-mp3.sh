#!/bin/bash

PROG="youtube-dl \
    --extract-audio \
    --audio-format mp3 \
    --no-mtime \
    -o ~/Movies/%(title)s.%(ext)s"

# -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' \
if [ $# -ne 1 ]
then
    echo "Usage:"
    echo "     youtube2mp3.sh URL"
    echo
    exit 1
fi

$PROG $1
