#!/bin/bash

PROGRAM=$1

VAR="$(which $PROGRAM)"
NEGITIVE_CHECK=""

if [ "$VAR" != "$NEGITIVE_CHECK" ]
then
    echo true
else
    echo false
fi

# echo $(["$VAR" = "$NEGITIVE_CHECK"])
