#!/bin/bash

## Remove docker containers using a common part of their names.
##
## The 1st parameter is used to filter container names using grep.

getImageNames() {
    docker images --format='{{.Repository}}'
}

images=$(getImageNames)

if [ -z "$1" ]; then
    echo -e "\e[1mAvailable images:\e[0m\n"
    echo $images | sed 's# #\n#g'
    echo -e "\n\e[1mNext step:\e[0m try again with a string common to each image you want to remove as a parameter."
    exit
fi

docker image rm -f $(echo $images | sed 's# #\n#g' | grep "$1" | tr '\n' ' ')