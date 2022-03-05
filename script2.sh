#!/usr/bin/env bash
# This script will count how many .txt, .csv, .dat, .jpeg and .sh files
# are in the directory.

# Usage: Type bash script2.sh.


# Psuedo-Code

# Operation to list and count each type of file

# Operation to output the file counts

# End


extensions=(".txt" ".csv" ".dat" ".jpeg" ".sh")
totalFiles=0
for type in "${extensions[@]}"; do
count=0
	for file in ./*"$type"; do # from what I have read online, the ./ in front of the *"$type" 
	# should shield the user from errors resulting from files with spaces.
		[ -e "$file" ] || continue
		# this should gracefully ignore file types that are not present
		((totalFiles=totalFiles+1)) # increments total File counter by 1, per loop
		((count=count+1)) # increments the file type counter by one per loop
	done
echo "There are $count files of file type $type" # user feedback per file type
done
echo  "There are $totalFiles total files of the specified types" # user feedback per total files

# The Basic Scripts assignment could be interpreted either that you wanted a count of each file type
# or a total count, so you got both.

#echo "Error Checking: The script finished running"

# Credits
# https://www.freecodecamp.org/news/bash-array-how-to-declare-an-array-of-strings-in-a-bash-script/
# http://mywiki.wooledge.org/BashPitfalls#line-57
# my neighbor, Nic Clair
