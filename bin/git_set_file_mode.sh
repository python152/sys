#!/bin/bash

for d in */; do
    printf "Processing $d \n"
    cd $d; git config core.fileMode off; cd ..
done
