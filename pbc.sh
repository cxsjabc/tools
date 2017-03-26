#!/bin/bash

if [ -z $1 ]
then
	echo "Missing file name!"
	exit -1
fi

cat $1 | pbcopy
