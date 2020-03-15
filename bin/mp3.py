#!/usr/bin/env python
#
# Fix mp3 basic tags (album and title) using well-formatted file name:
#       
#   Artist Name - Song Name.mp3
#
# Dependency install: 
#
#   brew install libmagic
#   pip install eye3d
#
#
# Run:
#   change to directory with mp3 files,
#   mp3.py --fixtag
#

import os
import sys
import glob
import eyed3
import argparse

global ARGS

# This method is taken from SO thread
# https://stackoverflow.com/questions/287871/how-to-print-colored-text-in-terminal-in-python
class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

def my_parse_args():
    parser = argparse.ArgumentParser(description="mp3.py - command line tool for batch mp3 processing")
    parser.add_argument("--fixtag", action='store_true', help="check and fixing tags")
    parser.add_argument("--retag", action='store_true', help="check and fixing tags")
    args = parser.parse_args()
    return args

def fix_tags():
    skip_cnt = 0
    err_cnt = 0
    tot_cnt = 0
    change_cnt = 0

    files = glob.glob("*.mp3")
    for mp3file in files:
        tot_cnt += 1

        if "-" in mp3file:
            modified = False

            fields = mp3file.split("-")
            artist = fields[0].strip()
            title = fields[1].strip()[:-4]

            print(mp3file, end='')
            audiofile = eyed3.load(mp3file)

            if audiofile.tag.artist is None or ARGS.retag:
                modified = True
                audiofile.tag.artist = artist
                print("\n\tAdd artist: [{}]".format(bcolors.WARNING + artist + bcolors.ENDC))

            if audiofile.tag.title is None or ARGS.retag:
                modified = True
                audiofile.tag.title = title
                print("\n\tAdd title: [{}]".format(bcolors.WARNING + title + bcolors.ENDC))

            if modified:
                change_cnt += 1
                audiofile.tag.save()
            else:
                print(bcolors.OKGREEN + " ... Skipped" + bcolors.ENDC)
                skip_cnt += 1

        else:
            err_cnt += 1
            print("*** Error *** ", bcolors.FAIL + mp3file + bcolors.ENDC)

    print("\n\nSummary: total({}), changed({}), skipped({}), errors({})\n".format(
        tot_cnt, change_cnt, skip_cnt, err_cnt))

def main():
    global ARGS
    ARGS = my_parse_args()
    if ARGS.fixtag or ARGS.retag:
        fix_tags()

if __name__ == "__main__":
    main()