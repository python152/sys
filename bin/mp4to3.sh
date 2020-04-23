#!/usr/bin/env bash

# variable rate
# ffmpeg -i video.mp4 -vn \
#       -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 \
#        audio.mp3

if [ $# -ne 1 ]; then
    echo "mp4to3.sh video.mp4"
    exit 1
fi


FILE_BASE=`basename "$1" .mp4`

ffmpeg -i "$1" -vn \
       -acodec libmp3lame -ac 2 -ab 160k -ar 48000 \
        "$FILE_BASE".mp3
