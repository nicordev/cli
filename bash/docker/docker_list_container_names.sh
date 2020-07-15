#!/bin/bash

## List docker container names.
##
## The 1st parameter can be used to filter results using grep.

listContainerIds() {
    docker ps -aq --no-trunc
}

getContainerNames() {
    docker inspect --format='{{.Name}}' $(listContainerIds)
}

containers=$(getContainerNames)

if [ ! -z "$1" ]; then
    echo $containers | sed 's#/##g' | sed 's# #\n#g' | grep "$1"
    exit
fi

echo $containers | sed 's#/##g' | sed 's# #\n#g'
