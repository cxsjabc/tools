#!/bin/bash

PATH_ROOT=~/codes

CURR_DIR=`pwd`

COMM=${PATH_ROOT}/common
BASIC=${PATH_ROOT}/basic
ALGO=${PATH_ROOT}/algorithm
TOOLS=${PATH_ROOT}/tools

cd $COMM
echo "Dir: $COMM"
git status .

cd $TOOLS
echo "Dir: $TOOLS"
git status .

cd $ALGO
echo "Dir: $ALGO"
git status .

cd $BASIC
echo "Dir: $BASIC"
git status .

cd $CURR_DIR
