#!/bin/bash
git remote rm origin
git remote add origin ssh://git@bitbucket.org/fwang2/$1.git

# -u set upstream
git push -u origin --all

# push all the tags as well

git push -u origin --tags


