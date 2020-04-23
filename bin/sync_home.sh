#!/bin/bash

REPOS="sys PIO notes bio placement math workload spider2"

for h in $REPOS; do

    if [ -d $HOME/$h ]; then
        echo "update $h"
        cd $HOME/$h; git pull
        cd $HOME
    fi
done


