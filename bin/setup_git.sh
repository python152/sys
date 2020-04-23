#!/bin/bash
OS=`uname -s`
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.unstage 'reset HEAD --'
git config --global alias.last 'log -1 HEAD'
git config --global user.email "fwang2@gmail.com"
git config --global user.name "Feiyi Wang"
git config --global core.fileMode false
git config --global alias.x 'log --pretty=format:'%h' -n 1'
git config --global push.default matching
git config --global core.excludesfile ~/sys/configure/gitignore_global

git config --global alias.lg \
    "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Avoid ESC character in GIT
git config --global core.pager "less -r"
git config --global core.fileMode false



# this undo is taken from:
# http://megakemp.com/2016/08/25/git-undo
git config --global alias.undo '!f() { \
    git reset --hard $(git rev-parse --abbrev-ref HEAD)@{${1-1}}; \
}; f'

