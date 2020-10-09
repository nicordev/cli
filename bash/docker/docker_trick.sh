#!/bin/bash

## Run some useful docker commands.
##
## Usage: docker_trick.sh [functionName] [argument]

listImageChildren() {
    docker inspect --format='{{.Id}} {{.Parent}}' $(docker images --filter since=$1 --quiet)
}

removeUselessImages() {
    docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
}

stopAllContainers() {
    docker stop $(docker ps -a -q)
}

if [ -z "$1" ]; then
    # List available functions
    cat $0 | grep -E '^[a-z]+[a-zA-Z0-9]*\(\) \{$' | sed 's#() {$##'
fi

$@