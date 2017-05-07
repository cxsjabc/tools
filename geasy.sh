#!/bin/bash

# generate a easy c file
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
		if [ -e $START.easy.c ] ; then
			echo "$START.easy.c already exists!"
			((++IGN_CNT))
			((++START))
			continue
		fi 
		cp _codeup.c $START.easy.c
		if [ $? -eq 0 ] ; then
			echo "$START.easy.c is created!"
			((++CP_CNT))
		else
			echo "Error when copy:$START.easy.c!"
			((++ERR_CNT))
		fi
		((++START))
	done
	echo "Copied:$CP_CNT, Ignored:$IGN_CNT, Errored:$ERR_CNT"
	continue
fi

if [ -e $1.easy.c ] ; then
	echo "$1.easy.c already exists!"
	((++IGN_CNT))
	shift
	continue
fi 

cp _codeup.c $1.easy.c

if [ $? -eq 0 ] ; then
	echo "$1.easy.c is created!"
	((++CP_CNT))
else
	echo "Error when copy:$1.easy.c!"
	((++ERR_CNT))
fi

shift
done

echo "Copied:$CP_CNT, Ignored:$IGN_CNT, Errored:$ERR_CNT"
