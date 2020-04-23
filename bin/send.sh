#!/bin/bash

# $1 is the file to attach
# $2 is the receipent

# echo "" | mutt -a attachment.txt -s "xdd write results" -- fwang2@ornl.gov

echo "" | mutt -a $1 -s "$2" -- $3

