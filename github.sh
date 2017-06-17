#!/bin/bash
# run on Mac OS

while [ ! -z $1 ]
do
	# special case for simple algorithm repo accessing
	REPO=${1:0:2}
	if [ $REPO == 'al' ]
	then 
		REPO=algorithm
	else
		REPO=$1
	fi
	echo "Will open github :$REPO"

	# because i am running on Mac, so i can use "open" command.
	# if linux or windows, please use commands themselves.	
	open https://github.com/cxsjabc/$REPO
	shift

	# sleep 5
done
