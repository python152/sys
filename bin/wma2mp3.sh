#!/bin/sh

for file in *.WMA; do ffmpeg -i "${file}"  -acodec libmp3lame -ab 192k "${file/.WMA/.mp3}"; done

