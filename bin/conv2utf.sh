#!/bin/bash

iconv -f ISO-8859-9 -t utf-8 < $1 > x.tmp
mv -f x.tmp $1

