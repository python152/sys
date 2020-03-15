#!/usr/bin/env bash

bb_repo="histo-py sts-parser chash benchmark ceph-eval bio FaceMatch olcf-atlas \
    bbx sys research resume lustre-internals ceph-report trial spider1-review www \
    lustre-test spider2-review bbx-report ldrd-dp nrs-simulator simfs myfonts \
    storage-reliability workload placement" 

github_repo="notes"

DEST=$HOME/bb_backup

if [ ! -d $DEST ]; then
    mkdir -p $DEST
fi

for dir in $bb_repo
do
    workdir=$DEST/$dir
    if [ -d $workdir ]; then
        echo "Update git repo $workdir"
        cd $workdir
        git pull
    else 
        cd $DEST
        echo "Cloning $workdir"
        git clone ssh://git@bitbucket.org/fwang2/$dir.git
    fi

done

for dir in $github_repo
do
    workdir=$DEST/$dir
    if [ -d $workdir ]; then
        echo "Update git repo $workdir"
        cd $workdir
        git pull
    else 
        cd $DEST
        echo "Cloning $workdir"
        git clone ssh://git@github.com/fwang2/$dir.git
    fi

done


echo " === ALL DONE === "


