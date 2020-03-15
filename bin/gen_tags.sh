#!/bin/bash
curdir=`pwd`
cd $curdir
ret=`which ctags`
if [ $? -eq 0 ]; then
    echo "running ctags"
    ctags -R -o newtags .
    mv -f newtags tags
else
    echo "no ctags found"
fi
ret=`which cscope`
if [ $? -eq 0 ]; then
    echo "running cscope"
    cscope -Rbq
fi

