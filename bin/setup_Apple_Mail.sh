#!/bin/bash

# set minimum font size for Apple Mail
defaults write com.apple.mail MinimumHTMLFontSize 13

# set bcc
defaults write com.apple.mail UserHeaders '{"Bcc" = "feiyiw@gmail.com";}'

# if you want to disable this:
#   -> defaults delete com.apple.mail UserHeaders

# read back gcc
defaults read com.apple.mail UserHeaders

