#!/usr/bin/env bash
# This script will intake the pathname of a file or directory and output a
# description of the item as a file, directory, or link as well as the
# current user's permissions are with respect to the entered data.

# Usage: Type bash script1.sh. When prompted enter the pathname of the
# file or directory you would like information for, then press the enter key.


# Psuedo-Code

# Get UserInput, and assign to variable

# Operation to determine file, directory, or link
# echo This item is a: file, directory, link

# Operation to determine user's permissions
# echo The current user has permission to: Read, Write, Execute

# End


echo "Type your pathname now: "

read -r pathname

###### NOTE: if the user enters the tilde character the script will not
# work as intended and will exit with error 1. This is due to a limitation
# in bash and I do not have the neccessary bash knowledge to remedy the
# situation.

# echo "Error Checking: The user input is $pathname"



if [ -f "$pathname" ]; then
	echo "$pathname leads to a file"

elif [ -d "$pathname" ]; then
	echo "$pathname leads to a directory"

elif [ -L "$pathname" ]; then
	echo "$pathname leads to a link"
fi



if [ -a "$pathname" ]; then


	if [ -r "$pathname" ]; then
		echo "You have read privileges"
	else echo "You do not have read privileges"
	fi


	if [ -w "$pathname" ]; then
		echo "You have write privileges"
	else echo "You do not have write privileges"
	fi


	if [ -x "$pathname" ]; then
		echo "You have execute privileges"
	else echo "You do not have execute privileges"
	fi

else echo "This is not a valid selection"
exit 1

fi

# echo "Error Checking: The script finished running"

# Credits
# https://swcarpentry.github.io/shell-novice/05-loop/index.html
# https://www.shellcheck.net/
# https://stackoverflow.com/questions/8512462/looping-through-all-files-in-a-directory
