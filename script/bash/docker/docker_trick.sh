#!/bin/bash

## Run some useful docker commands.
##
## Usage: docker_trick.sh [functionName] [argument]

SCRIPT_NAME=$(basename $0)

listContainersAsJson() {
    docker container ls --format='{{json .}}{{ println }}'
}

listContainerNames() {
    docker container ls --format='{{.Names}}'
}

showContainerIp() {
    if [ -z $1 ]; then
        echo -e "\e[1mContainers:\e[0m\n"
        docker container ls --format='{{.ID}}\t{{.Names}}'
        echo -e "\n${SCRIPT_NAME} showContainerIp \e[33mcontainerIdOrName\e[0m"
        exit 1
    fi

    docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$1"
}

listImagesAsJson() {
    docker container ls --format='{{json .}}{{ println }}'
}

listImageChildren() {
    if [ -z $1 ]; then
        echo -e "\e[1mImages:\e[0m\n"
        docker image ls --format='{{.ID}}\t{{.Repository}}:{{.Tag}}'
        echo -e "\n${SCRIPT_NAME} listImageChildren \e[33mimageIdOrName\e[0m"
        exit 1
    fi
    
    docker inspect --format='{{.Id}} {{.Parent}}' $(docker images --filter since="$1" --quiet)
}

removeUselessImages() {
    docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
}

stopAllContainers() {
    docker stop $(docker ps -a -q)
}

_listAvailableFunctions() {
    cat $0 | grep -E '^[a-z]+[a-zA-Z0-9]*\(\) \{$' | sed 's#() {$##'
}

if [ $# -eq 0 ]; then
    _listAvailableFunctions
    exit
fi

$@