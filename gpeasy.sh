#!/bin/bash

# generate a easy cpp file
# writer: xichen

echo "Owner: xichen"
FILE_CNT=$#
#echo "FILE_CNT:$#"
CONT=0
START=
END=
CP_CNT=0
ERR_CNT=0
IGN_CNT=0

while true
do


if [ -z $1 ] && [ $FILE_CNT -lt 1 ]
then
	echo "No file name!"
	exit -1
fi

if [ -z $1 ]
then
	break
fi

if [ $1 = "-c" ] ; then
	CONT=1
	shift
	START=$1
	shift
	END=$1
	shift
	
	# copy file from START to END
	#echo "START:$START, END:$END"
	while [ $START -le $END ]; do
		if [ -e $START.easy.cpp ] ; then
			echo "$START.easy.cpp already exists!"
			((++IGN_CNT))
			((++START))
			continue
		fi 
		cp _codeup.cpp $START.easy.cpp
		if [ $? -eq 0 ] ; then
			echo "$START.easy.cpp is created!"
			((++CP_CNT))
		else
			echo "Error when copy:$START.easy.cpp!"
			((++ERR_CNT))
		fi
		((++START))
	done
	echo "Copied:$CP_CNT, Ignored:$IGN_CNT, Errored:$ERR_CNT"
	exit 0	
fi

if [ -e $1.easy.cpp ] ; then
	echo "$1.easy.cpp already exists!"
	((++IGN_CNT))
	shift
	continue
fi 

cp _codeup.cpp $1.easy.cpp

if [ $? -eq 0 ] ; then
	echo "$1.easy.cpp is created!"
	((++CP_CNT))
else
	echo "Error when copy:$1.easy.cpp!"
	((++ERR_CNT))
fi

shift
done

echo "Copied:$CP_CNT, Ignored:$IGN_CNT, Errored:$ERR_CNT"
