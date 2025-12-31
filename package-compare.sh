#!/bin/bash
# I have a text file I use to keep track of installed packages and their purposes.
# Every so often I compare this to the current installed packages to see which need to be
# added and organized, or removed.
LIST_FILE=$1
LIST=$(sed '/^$/d;/#.*/d' "$LIST_FILE" | sort -)
CURR=$(pacman -Qe | sed 's/ .*//g' | sort -)
echo "*** NEW PACKAGES ***"
comm -23 <(echo "$CURR") <(echo "$LIST")
printf "\n*** REMOVED PACKAGES ***"
comm -13 <(echo "$CURR") <(echo "$LIST")
