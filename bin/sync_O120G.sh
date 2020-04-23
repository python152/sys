#!/usr/bin/env bash

# assuming O120G is mounted

if [ -d /Volumes/O120G/2010Keepers ]; then
    echo "Starting syncing ..."
    rsync -a --delete /Volumes/O120G/2010Keepers/ /Users/fwang2/Private/2010Keepers/
else
    echo "Cannot locate the source folder, exit!"
fi




