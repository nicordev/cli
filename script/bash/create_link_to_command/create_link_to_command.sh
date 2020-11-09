#!/bin/bash

# Description:   create a hard link of a file into /usr/local/bin

destinationFolder="/usr/local/bin"

if [ -z "$1" ]; then
    echo "Missing file path."
    exit
fi

sudo ln "$1" "$destinationFolder"

echo "Command $1 linked into $destinationFolder."