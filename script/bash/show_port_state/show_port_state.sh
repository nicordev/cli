#!/bin/bash

portState='LISTEN'

if [ -z "$1" ]; then
    echo 'Add port number.'
    exit
fi

if [ -z "$2" ]; then
    echo 'Filtering LISTEN state ports. Add --all to show other states.'
elif [ "$2" == "--all" ]; then
    lsof -i "TCP:$1"
    exit
else
    portState="$2"
fi

lsof -i "TCP:$1" | grep "$portState"