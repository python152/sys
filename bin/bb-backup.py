#!/usr/bin/env python3
import argparse
import os.path
import sys
from sh import git
from bitbucket.bitbucket import Bitbucket

ARGS = None
bb = None
dest = None

def process_output(line):
    print(line)

def parse_args():
    parser = argparse.ArgumentParser(description="bb-backup")
    parser.add_argument("--username", required=True)
    parser.add_argument("--password", required=True)
    parser.add_argument("--outdir", default=".", help="output directory")

    return parser.parse_args()

def printer(line):
    sys.stdout.write(line)

def clone(repo):
    global dest
    dest = os.path.realpath(ARGS.outdir)
    destrepo = os.path.join(dest, repo)

    if not os.path.exists(destrepo):
        os.chdir(dest)
        # pp = git.clone("--progress", "git@bitbucket.org:%s/%s" %
        #               (ARGS.username, repo), _err=process_output,
        #               _out_bufsize=0)
        git.clone("git@bitbucket.org:%s/%s" %
                        (ARGS.username, repo), _err=process_output,
                       _out_bufsize=0)
    else:
        # do git pull
        os.chdir(destrepo)
        pp = git.pull(_out=process_output, _out_bufsize=1)
        pp.wait()

def main():
    global ARGS, bb, dest
    ARGS = parse_args()
    bb = Bitbucket(ARGS.username, ARGS.password)
    status, repos = bb.repository.all()

    for r in repos:
        print("Found repo: %s, cloning ... " % r['name'])
        clone(r['name'])

if __name__ == "__main__": main()

