#!/bin/bash

## Call ls or ls -alF (commonly alias ll) with grep to filter the list.

listFull() {
    ls -alF
}

if [[ -z "$1" ]]; then
    ls
    exit
fi

if [[ "$1" == "--full" ]]; then
    
    if [[ -z "$2" ]]; then
        listFull
        exit
    fi

    listFull | grep $2
    exit
fi

ls | grep $1