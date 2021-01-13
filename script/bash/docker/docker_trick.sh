#!/bin/bash

## Run some useful docker commands.
##
## Usage: docker_trick.sh [functionName] [argument]

listContainersAsJson() {
    docker container ls --format='{{json .}}'
}

listContainerNames() {
    docker container ls --format='{{.Names}}'
}

listContainerIp() {
    docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$1"
}

listImageChildren() {
    docker inspect --format='{{.Id}} {{.Parent}}' $(docker images --filter since=$1 --quiet)
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