#!/bin/sh

# perl -i -p -e "s/Microsoft Word/OpenOffice Write/g" *.txt
perl -i -p -e "s/$1/$2/g" $3

