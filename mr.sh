#!/bin/bash

if [ -z "$1" ]
then
	echo "Need argument..."
	exit -1
fi

REL_PATH=../
#COMMON_C="../../common/common.c ../../common/gen.c ../../common/arr.c"
source common.sh

DEST=${1%.*}
ARG1=$1
shift

gcc $@ -Wall -g -o $DEST $ARG1 ${COMMON_C} && ./$DEST
