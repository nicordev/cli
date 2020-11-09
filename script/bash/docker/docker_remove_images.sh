#!/bin/bash

## Remove docker containers using a common part of their names.
##
## The 1st parameter is used to filter container names using grep.

styleStrong="\e[1m"
styleNormal="\e[0m"
styleEmphasis="\e[33m"

listImages() {
    docker images --format="{{.ID}}\t{{.Repository}}"
}

getFilteredImageIds() {
    listImages | grep "$1" | cut -f 1 | tr '\n' ' '
}

if [ -z "$1" ]; then
    echo -e "${styleStrong}Available images:${styleNormal}\n"
    listImages
    echo -e "\n${styleStrong}Next step:${styleNormal} try again with a string common to each image name you want to remove as a parameter."
    echo -e "\nIf the image has no name, run ${styleEmphasis}docker image rm -f imageIdHere${styleNormal}"
    exit
fi

docker image rm -f $(getFilteredImageIds "$1")