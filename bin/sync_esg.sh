#!/usr/bin/env bash

if [ $# -ne 1 ]; then
    echo "Missing argument: commit or update"
fi

git_repo="esgf-web-fe esg-search esg-orp esgf-security esgf-idp" 

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
                git co master
                git pull
                git co devel
                git pull
            fi

        done

        ;;

esac

cd $HOME
