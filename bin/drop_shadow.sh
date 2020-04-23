#!/bin/bash
# first argument: file
# second argument: border size 1x1, 2x2 etc.

image-shadow () {
  # acquire image width and height  
  imgwidth=`identify -format %w $1`
  imgheight=`identify -format %h $1`
  out=${1%.*}-shadow.${1#*.}
  in=$1
  echo "Converted file : $out"
  if [ ! -z $2 ] ; then 
    convert $in -frame $2 $out
    in=$out
  fi
  convert $in \( +clone -background gray -shadow 50x3+5+5 \) \
    +swap -background white -layers merge +repage $out
}

image-shadow $1 $2
