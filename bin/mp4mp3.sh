#!/bin/bash
#
# we need 1 parameters: the source
# 
# To use this program
# create and cd into a new directory (where the output file will be)
# then:
#  
# mp4mp3 src_directory
# 
#

# while IFS='' read -r line || [[ -n "$line" ]]; do
for f in "$1"/*.*; do

    echo "Processing: $f"

    filename=$(basename "$f")  # with extension
    filename="${filename%.*}"  # without extension
    outf=$filename.mp3

    # VBR: target bitrate 140-165Kbit/s

    ffmpeg -i "$f" -vn -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 $outf
done

#done < "$1"
