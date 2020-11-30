#! /bin/bash

# Yes, I am lazy...

if [ $# -eq 0 ]
then
    echo "$(basename $0) file"
    exit 1
fi

cp "$1" /usr/local/bin