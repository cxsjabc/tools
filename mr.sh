#!/bin/bash

if [ -z "$1" ]
then
	echo "Need argument..."
	exit -1
fi

COMMON_C=../common/common.c

gcc -g -o $1.elf $1.c ${COMMON_C} && ./$1.elf
