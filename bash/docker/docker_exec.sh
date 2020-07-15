#!/bin/bash

# Run docker exec on a specific container.

styleStrong="\e[1m"
styleNormal="\e[0m"

# >>>>>>>>>>>>>>>>>>>>>>>> functions >>>>>>>>>>>>>>>>>>>>>>>>

listContainerIds() {
    docker ps -q --no-trunc
}

listContainerNames() {
    docker inspect --format='{{.Name}}' $(listContainerIds) | sed "s#^/##"
}

askContainer() {
    echo -e "${styleStrong}Available containers:${styleNormal}\n"
    listContainerNames
    echo -e "\n${styleStrong}Which container?${styleNormal}"
    read container
}

askCommandToExecute() {
    echo -e "${styleStrong}Which command to execute?${styleNormal} (default: sh)"
    read answer

    if [ ! -z "$answer" ]; then
        commandToRun="$answer"
    fi
}

# <<<<<<<<<<<<<<<<<<<<<<<< functions <<<<<<<<<<<<<<<<<<<<<<<<

commandToRun='sh'

if [ -z "$1" ] || [ "$1" == "--use-default-command" ]
then
    askContainer
else
    container="$1"
fi

if [ ! -z "$2" ]
then
    commandToRun="$2"
elif [ "$1" != "--use-default-command" ]
then
    askCommandToExecute
fi

docker exec -ti "$container" $commandToRun