#!/usr/bin/env bash
# This script will create a new file called Summary.txt which will contain a
# summary of the data found in the .xml files found in
# data-shell/data/elements.
# Usage: type bash complexscript.sh and press enter.
# Psuedo-Code
# create file Summary.txt
# Print Column Headers of Name, Abbreviation, Weight, Number, and
# Liquid Range
# for every file in dir-
# Verify that the file is a valid .xml file
# extract <element name> <symbol> <atomic-weight> <atomic-number>
# <boiling-point> <melting point> values and append those to the
# Summary.txt file.
# end for loop
# data wrangling
# sort the records by atomic number
# print a blank line
# print a time and date stamp
# End
rm Summary.txt # removes any instance of Summary.txt already present
touch Summary.txt # creates file Summary.txt
directory="data-shell/data/elements" # sets the directory to a variable
for xmlfile in "$directory"/*.xml ; do # starts a
# loop that will go through each file that is an .xml file
	echo -en ":" >> Summary.txt
	# adds colon between the start of each loop for data wrangling
	grep -o -P '(?<=<element name=").*(?="\/>)' "$xmlfile" >> Summary.txt
	# searches for anything between the regex in the parenthesis and
	# outputs to the file
	grep -o -P '(?<=<symbol>).*(?=<\/symbol>)' "$xmlfile" >> Summary.txt
	# searches for anything between the regex in the parenthesis and
	# outputs to the file
	grep -o -P '(?<=<atomic-weight>).*(?=<\/atomic-weight>)' "$xmlfile" >> Summary.txt
	# searches for anything between the regex in the parenthesis and
	# outputs to the file
	grep -o -P '(?<=<atomic-number>).*(?=<\/atomic-number>)' "$xmlfile" >> Summary.txt
	# searches for anything between the regex in the parenthesis and
	# outputs to the file
	grep -o -P '(?<=<boiling-point>).*(?=<\/boiling-point>)' "$xmlfile" >> Summary.txt
	# searches for anything between the regex in the parenthesis and
	# outputs to the file
	grep -o -P '(?<=<melting-point>).*(?=<\/melting-point>)' "$xmlfile" >> Summary.txt
	# searches for anything between the regex in the parenthesis and
	# outputs to the file
done
# ends the for loop iterating through the .xml files
touch holder.txt
# creates an empty text file to hold files for manipulation
tr '\n' ' ' < Summary.txt > holder.txt
# replaces newlines with spaces putting each elements attributes on
# one line
sed 's/^://' holder.txt > Summary.txt
# removes only the instance of a colon in the first space of line
tr : '\n' < Summary.txt > holder.txt
# replaces colons with new lines
sort -nk 4,4 holder.txt > Summary.txt
# sorts numerically by the fourth column
echo "Name Abbreviation Weight Number Liquid Range" > holder.txt
# writes Column headers and blanks file
cat Summary.txt >> holder.txt
# appends the text in Summary file to holder file after headers
column -t holder.txt > Summary.txt
# writes all the information in holder file to columns in the
# Summary file
rm holder.txt
# removes the holder file as we are done with it
echo -en "\n" >> Summary.txt
# adds a blank line at the end of the Summary file
date >> Summary.txt
#adds a time and date stamp at the end of the Summary file
# Credits
# http://mywiki.wooledge.org/BashFAQ/113
# https://stackoverflow.com/questions/54034541/extract-data-from-xml-file-using-shell-commands
# https://www.linux.org/threads/check-for-an-xml-file-if-its-there-do-something.33249/
# https://cheatography.com/davechild/cheat-sheets/regular-expressions/
# https://regex101.com/
# https://www.shellcheck.net/
# https://www.codegrepper.com/
# https://linux.die.net/man/1/grep
# https://stackoverflow.com/questions/15580144/how-to-concatenate-multiple-lines-of-output-to-one-line
# https://linux.die.net/man/1/date
# https://vitux.com/how-to-display-file-contents-in-column-format-in-linux-terminal/
# https://www.theunixschool.com/2014/08/sed-examples-remove-delete-chars-from-line-file.html
# https://stackoverflow.com/questions/49821562/pretty-print-a-space-delimited-file
# https://unix.stackexchange.com/questions/104525/sort-based-on-the-third-column
