#!/bin/bash

# this will recursively get everything from a supplied 
# directory, without re-creating the directory structure

# this will download everything to the current directory
# so you will want to create a directory first

#
# Only get rpms
#
#

if [ -z $1 ]; then
    echo "need a URL"
    exit 1
fi

REJECT="index.html*,repomd.xml"
ACCEPT="*.rpm"

#
# -r    recursive
# -np   no parents
# -nH   no hostname
# -nd   no directories - flat creation of retrieved files

wget -r -nH -nd -np -A $ACCEPT $1

