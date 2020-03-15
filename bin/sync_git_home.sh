#!/usr/bin/env bash
#
# sync git repo from home directories
if [ $# -ne 1 ]; then
    echo "Missing argument: commit or update"
fi

git_repo="www resume sys gitolite-admin huarong myfonts \
    iotests trial research huarong math pcircle gpfs-eval fgr-tr"


case "$1" in
    commit)
        for dir in $git_repo
        do
            workdir=$HOME/$dir

            if [ -d $workdir ]; then
                echo "Commit git repo $workdir"
                cd $workdir 
                git commit -am "git auto commit"
                git push
            fi
        done

        ;;
    update)
        for dir in $git_repo
        do
            workdir=$HOME/$dir
            if [ -d $workdir ]; then
                echo "Update git repo $workdir"
                cd $workdir 
                git pull --rebase
            fi

        done

        ;;

esac

cd $HOME
