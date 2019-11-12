#!/bin/bash

PROGRAM=$1

VAR="$(which $PROGRAM)"
CHECK=""

if [ "$VAR" = "$CHECK" ]
then
    echo "not found"
else
    echo "found"
fi
date