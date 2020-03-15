#!/bin/bash

# this command assumes that Linux utilities "rename"
# is present. You can install it by "brew install rename"

# -s means simple substitution


find . -type f  -name "*.m4v" -exec rename -s .m4v .mp4 '{}' \;
