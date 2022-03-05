#!/usr/bin/env bash
# This script will run in the background and periodically update your
# Summary.txt file if its dependency files have been updated.
# Usage: Invoke updater.sh once and it will run in the background.
# NOTE: A better way to do this would be to make it a chron job, IMO,
# but this is what the instructions for the assignment say to do.
echo "updater.sh is running. Summary.txt will be updated at 12:00PM if its dependencies have changed. Press Enter"
# Lets user know that script is running and when output will occur
runtime="12:00"
# writes the update time to variable
if [[ "$1" != "-n" ]]; then
# sets up an if loop to check to make sure that the script was not
# entered with the -n flag, which would cause an infinite loop.
	bash "$0" -n & disown
	# & puts the process into the background.
	exit $?
	# exits the nohup command
fi
# ends the if loop
while :
#sets an infinite loop
do
# do these actions conitnuously
	date='/bin/date +%H:%M'
	# sets the time to a variable
	if [ "$date" = "$runtime" ]
	# loop checking to see if the current time matches our update time
	then
	# if it is time to update
		make
		# run the makefile
	fi
	# ends the if loop
	sleep 60
	# runs the if loop every 60 seconds
done
# Credits
# https://bash.cyberciti.biz/guide/Infinite_while_loop
# https://linuxhint.com/sleep_command_linux/
# https://superuser.com/questions/1040938/run-a-shell-script-in-background-in-unix-at-specific-time-daily
# https://stackoverflow.com/questions/48619765/run-bash-script-in-background-by-default
