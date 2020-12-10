#! /bin/sh

## This script shows the file name and line number of syntax that is deprecated
## It finds problematic syntax from a text file

BUGS="$HOME/bin/bugs.txt"
cat *.map | grep -HrnwFf $BUGS
