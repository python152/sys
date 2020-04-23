#!/bin/bash

cd ~

echo "set up git"
sys/bin/setup_git.sh

echo "set up bash, R, tmux"
ln -sf sys/config/bashrc    .bashrc
ln -sf sys/config/bashrc    .bash_profile
ln -sf sys/R/Rprofile       .Rprofile
ln -sf sys/tmux/tmux.conf   .tmux.conf

