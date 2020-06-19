#!/bin/bash

## Remove docker containers using a common part of their names.
##
## The 1st parameter is used to filter container names using grep.

getContainerNames() {
    docker inspect --format='{{.Name}}' $(docker ps -aq --no-trunc)
}

containers=$(getContainerNames)

if [ -z "$1" ]; then
    echo -e "\e[1mAvailable containers:\e[0m\n"
    echo $containers | sed 's#/##g' | sed 's# #\n#g'
    echo -e "\nNext step: try again with a string common to each container you want to remove as a parameter."
    exit
fi

docker rm -f $(echo $containers | sed 's#/##g' | sed 's# #\n#g' | grep "$1" | tr '\n' ' ')