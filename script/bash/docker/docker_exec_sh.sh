#!/bin/sh

## Run docker exec on a specific container.
##
## docker_exec_sh.sh [containerName] [command = 'sh']
##
## If no arguments, then docker ps is run instead to show container names.
## If no second argument, then a shell 'sh' is opened.

if [ -z $1 ]
then
    echo "Please retry using a container name or id from the list:\n"
    docker ps
    exit
fi

commandToRun='sh'

if [ ! -z $2 ]
then
    commandToRun=$2
fi

docker exec -ti $1 $commandToRun