#!/usr/bin/env bash
# This script will read data from sunspot.txt and print the number of total
# sunspots per year on record and the monthly averages for each of the twelve
# months.

# Usage: type bash awkscript.sh and press enter. Input the file name at the
# prompt, press enter.

# Psuedo-Code

# Intake the file name from the user and assign to a variable

# List sunspots per year:
# Iterate through each line adding up the sunspots per year while counting
# the number of years and writing it to a variable for the next objective
# Display the sunspots per year to the user

# List the monthly averages:
# Iterate through each line adding up the number of sunspots per month and
# writing them to a variable for each month
# Divide total for each month by years to get averages
# Display the list of monthly averages to user

# End

filename="" # sets up variable for user input in below loop


while [ -z "$filename" ]; do # will repeat the loop if file is blank
        echo Input file name: # tells user to input file
        read -r filename # assigns input to variable
done # ends loop


awk ' /^.. ...... .... .. .. ..?.?/ {
	sunspots[$3]+=$6; monthlytotal[$4]+=$6; numyears[$4]++; years[$3]++;
}
	END { 
	print "Year - Total Sunspots";
	for (i in years) print i," - ", sunspots[i]
	PROCINFO["sorted_in"]="@ind_str_asc";
	print "Monthly Averages";
	for (i in monthlytotal) print i,":", monthlytotal[i]/numyears[i]
}' "$filename" # starts awk command of variable filename- awk '{}'
# $filename, telling awk to ignore any line not matching the format
# of the input data- /^.. ...... .... .. .. ...?/, the command adds the 
# number in the sunspots column together for every line that has a
# number in the year column and assigns those values to an array called
# sunspots - sunspots[$3]+=$6, the command also adds the number in the
# sunspots column together for every line that has a number in the months
# column and assigns those values to an array called monthlytotal-
# monthlytotal[$4]+=$6, the command increments for each line for both the
# following commands and adds them to thier respective variables- 
# numyears[$4]++; years[$3]++; command displays information to the user-
# print "Year - Total Sunspots", command then begins applying logic to the
# variables by displaying the year a space a dash and another space then 
# the number of sunspots per year for every line that has a year-
# for (i in years) print i," - ", sunspots[i], the command then sorts the
# following data in ascending order- PROCINFO["sorted_in"]="@ind_str_asc";,
# the command displays information to the user- print "Monthly Averages",
# command then displays the number of the month a colon and then the
# monthly total of susnspots divided by the number of years for every
# month- for (i in monthlytotal) print i,":", monthlytotal[i]/numyears[i]
