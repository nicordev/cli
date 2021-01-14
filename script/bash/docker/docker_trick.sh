#!/bin/bash

## Run some useful docker commands.
##
## Usage: docker_trick.sh [functionName] [argument]

SCRIPT_NAME=$(basename $0)

_extractImageAuthorNameTag() {
    [[ "$1" =~ ([^\/]+)\/([^:]+):(.+) ]]
    imageAuthor="${BASH_REMATCH[1]}"
    imageName="${BASH_REMATCH[2]}"
    imageTag="${BASH_REMATCH[3]}"
}

_extractImageFolder() {
    [[ "$1" =~ (.+\/)([^\/]+)$ ]]
    imageFolder="${BASH_REMATCH[1]}"
}

buildImage() {
    _extractImageAuthorNameTag "$1"
    _extractImageFolder "$2"
    imageFile="$2"
    image="$imageAuthor/$imageName:$imageTag"

    # help
    if [ -z "$imageAuthor" ] || [ -z "$imageName" ] || [ -z "$imageTag" ]; then
        echo -e "$SCRIPT_NAME ${FUNCNAME[0]} \e[33mimageAuthor/imageName:imageTag [imageFile]\e[0m"
        exit
    fi

    if [ -z "$imageFile" ] || [ -z "$imageFolder" ]; then
        docker build --pull --no-cache -t "$image"
        return
    fi
    
    docker build --pull --no-cache -t "$image" -f "$imageFile" "$imageFolder"
}

pushImage() {
    if [ -z $1 ]; then
        echo -e "$SCRIPT_NAME ${FUNCNAME[0]} \e[33mimageAuthor/imageName:imageTag\e[0m"
    fi

    docker push "$1"
}

buildPushImage() {
    buildImage $@
    pushImage "$image"
}

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

howItWorks() {
    cat $0
}

_listAvailableFunctions() {
    cat $0 | grep -E '^[a-z]+[a-zA-Z0-9]*\(\) \{$' | sed 's#() {$##'
}

if [ $# -eq 0 ]; then
    _listAvailableFunctions
    exit
fi

$@