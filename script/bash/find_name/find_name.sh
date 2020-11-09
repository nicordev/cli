#!/bin/bash

## find_name.sh fileNameHere [directoryToLookIntoHere = /]
##
## Run a find directoryToLookIntoHere -name fileNameHere 2> /dev/null
##
## Errors are muted thanks to 2> /dev/null, useful when you look from the root to avoid 'Permission denied' errors.

if [ -z $1 ]
then
    echo "Please enter what you're looking for as the first command argument."
    exit
fi

directoryToLookInto='/'

if [ ! -z $2 ]
then
    if [ $2 = '.' ]
    then
        currentDirectory=`pwd`
        echo "Looking into $currentDirectory..."
    else
        echo "Looking into $2..."
    fi
    
    directoryToLookInto=$2
fi

find $directoryToLookInto -name $1 2> /dev/null