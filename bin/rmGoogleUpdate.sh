#!/bin/sh
sudo /Library/Google/GoogleSoftwareUpdate/GoogleSoftwareUpdate.bundle/Contents/Resources/GoogleSoftwareUpdateAgent.app/Contents/Resources/install.py --uninstall

defaults write com.google.Keystone.Agent checkInterval 0

