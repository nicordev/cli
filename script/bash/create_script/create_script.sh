#!/bin/bash

createExecutableFile() {
    touch "$1"
    chmod +x "$1"
}

fileName="$1"

if [ -z "$1" ]; then
    echo -e "What file name?"
    read fileName
fi

if [ -z "$fileName" ]; then
    echo "See ya!"
    exit
fi

createExecutableFile "$fileName"