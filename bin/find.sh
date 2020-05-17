#!/bin/bash
if [[ "$#" != 1 ]]; then
  echo "Missing argument"
  exit 1
fi

find $1 -type d -print0 | while read -d '' -r dir; do
    files=("$dir"/*)
    printf "%5d files in directory %s\n" "${#files[@]}" "$dir"
done

