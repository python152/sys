#!/bin/bash

brew update
pkgs="ctags python gcc cmake corkscrew dos2unix git openmpi pkg-config python3 tmux wget \
    valgrind enscript"

for p in $pkgs 
do
    brew install $p
done

