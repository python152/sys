#!/bin/bash

# Download and keep mp4




if [ $# -ne 3 ]
then
    echo "Usage:"
    echo "    cut.sh vfile start length"
    echo
    exit 1
fi

ffmpeg -ss $2 -i $1 -t $3 -vcodec copy -acodec copy extract.mkv
