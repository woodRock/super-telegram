#! /bin/sh

##  This script counts the number of bugs.
##  It runs through all of the mapfiles in the current directory
##  It reads syntax likely to cause issues from a text file
##  It returns the number of lines containing bugs

BUGS="$HOME/bin/bugs.txt"
cat *.map | grep -wFf $BUGS | wc -l
