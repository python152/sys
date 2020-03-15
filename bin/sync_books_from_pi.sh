#!/bin/bash

DST="$HOME/Documents/Books/"
SRC="pi.local:/Users/f7b/Documents/Books/"

echo "Syncing: $SRC --> $DST"
rsync -a --exclude="Icon?" --exclude=.DS_Store --progress -e ssh "${SRC}" "${DST}"

