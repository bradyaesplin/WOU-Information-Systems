#!/usr/bin/env bash
# This script will play a number guessing game with the user. The script will
# pick a rand integer between 0-10 and ask user to guess a value. The script
# will give feedback to the user telling them too high or too low.
# When the correct value is guessed the script will terminate.

# Psuedo-Code

# Tell user the rules, and the string to type to exit

# Take user input and assign to variable

# Error check that user input is integer between 0-10, display error message
# if it is not

# Compare variable to chosen integer, give user feedback based on value.

# Display win message when user choice is correct.

# Exit

randomInt=$(( RANDOM %11 ))

#echo "Error Checking: The script chose - $randomInt"

echo "I have chosen a number between 0 and 10. You will guess what number I picked and I will tell you if you picked correctly or need to go higher or lower!"

while :; do
	read -p "Enter a number between 0-10: " inputInt
	[[ $inputInt =~ ^[0-9]+$ ]] || { echo "Error Checking: Enter a valid number"; continue; }
	if ((inputInt >= 0 && inputInt <= 10)); then
		# echo "Error Checking: The user input a valid number"
		if (( inputInt == randomInt )); then
			echo "You guessed the number!"
			break
		elif (( inputInt < randomInt)); then
			echo "You need to go higher!"
		elif (( inputInt > randomInt)); then
			echo "You need to go lower!"
		fi
	else
		echo "Error Checking: Number out of range 0-10, try again"
	fi
done

# Credits
# https://stackoverflow.com/questions/50521798/how-to-check-if-a-number-is-within-a-range-in-shell
# https://www.shellcheck.net
