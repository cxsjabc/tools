#!/bin/bash

if [ -z $1 ]; then
DEV=dev
else
DEV=$1
fi

echo "git push origin HEAD:${DEV}"
git push origin HEAD:$DEV
