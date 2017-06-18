#!/bin/bash

if [ -z $1 ] ; then
	echo "Arguments missing..."; exit -1
fi

git checkout $1 
