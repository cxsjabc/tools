#!/bin/bash
# run on Mac OS

while [ ! -z $1 ]
do
	echo "Will open github :$1"
	open https://github.com/cxsjabc/$1
	shift

	# sleep 5
done
