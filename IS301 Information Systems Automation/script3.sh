#!/usr/bin/env bash
# This script will take user input to specify the file extention
# to change. The script will then take user input to determine which prefix
# the user would like to affix to the file names. The script will then add
# the specified prefix to all files of that type within the directory.
# If no prefix is specified the script will use "old" as default.

# Psuedo-Code

# Get user input for file extension, assign to variable: extension.

# Assign string: old to variable: prefix. Offer user input for prefix,
# and overwrite variable: prefix.

# Operation to search through files. If extension type matches variable:
# extension, add prefix to start of file name.

# End

echo "What prefix would you like the files to have? (Press enter for default prefix - old)"

read -r prefix

if [ -z "$prefix" ]; then # checks to see if user left prefix blank
	# echo "Error Checking: Prefix is blank"
	prefix="old" # assigns prefix to old if user left it blank
fi

# echo "Error Checking: $prefix"

extension=""
while [ -z "$extension" ];do # will repeat the below prompt until the user enters an extension
	echo "What filename extension would you like to run the script on? <filename>.???"
	read -r extension # assigns user input to variable extension
	# echo "Error Checking: $extension"
done

search=($(find . -maxdepth 1 -type f -name "*\\$extension" -printf '%f\n')) # searches through the
# current directory for files with an extension that the user has input and assigns the results
# to the variable - search

for file in "${search[@]}"; do # loops through all files that were found
	mv "$file" "$prefix$file" # renames each file in loop with user specified prefix
done

# Credits
# my neighbor Nic Clair
# https://www.shellcheck.net/
# https://swcarpentry.github.io/shell-novice/05-loop/index.html
