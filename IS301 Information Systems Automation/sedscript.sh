#!/usr/bin/env bash
# This script will intake a text file name, find all instances of the name
# "Lizzy" and replace them with "Elizabeth" then save the file with the
# suffix of "-formal" before the .txt file extension.

# Usage: Type your filename when prompted, press the Enter key.


# Psuedo-Code

# Intake filename from user. In the form of "originalname.txt"

# sed file output results to new file named "originalname-formal.txt"

# End

originalfile="" # sets up variable for user input in below loop

while [ -z "$originalfile" ]; do # will repeat the loop if file is blank
        echo Input file name: # tells user to input file
        read -r originalfile # assigns input to variable
done # ends loop

sed 's/\b[Ll]izzy\b/Elizabeth/g' <./"$originalfile" >"${originalfile%.txt}-formal.txt"
# replaces all instances of Lizzy or lizzy with Elizabeth and writes the
# results into a copy of the original file with -formal added before the
# .txt file extension 


# Credits
# https://askubuntu.com/questions/20414/find-and-replace-text-within-a-file-using-commands
# https://www.shellcheck.net/
# https://regexper.com/#%5Cb%5BLl%5Dizzie%5Cb
# https://regex101.com/
# https://www.grymoire.com/Unix/Sed.html
# http://man.he.net/?topic=sed&section=all
# https://unix.stackexchange.com/questions/370313/add-text-to-end-of-the-filename-but-before-extension
