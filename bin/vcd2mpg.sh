#!/bin/bash

# we need 4 parameters
# volume_label file_name start_number end_number prefix
# 
# for example:
#
# ./vcd2mpg.sh __ AVSEQ 1 12 流行吉他

LABEL=$1
FN=$2
START=$3
END=$4
PREFIX=$5

FROM="/Volumes/$LABEL/MPEGAV/$FN"

for (( i=$START; i<=$END; i++))
do
    # calculate the length of the string
    len=${#i}
   
    if [[ len -eq 1 ]]
    then
        x=0$i
    else
        x=$i
    fi

    $HOME/sys/bin/vcdgear -dat2mpg $FROM$x.DAT $PREFIX-$x.mpg 

done

