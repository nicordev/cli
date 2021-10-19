#!/bin/bash

SCRIPT_NAME=$(basename $0)

_askConfirmationDefaultYes() {
    local answer='yes'
    echo -e "\e[1m$@Continue?\e[0m [YES/no] "
    read answer

    if [[ ${answer,,} =~ ^(n) ]]; then
        return 1
    fi
}

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

addDockerComposePortsParameter() {
    if [ $# -lt 3 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mdockerComposeFileHere serviceNameHere portBindingHere\e[0m"

        return 1
    fi
    echo $3
    sed -i "s/${2}:/&\n    ports:\n      - ${3}/" "${1}"
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

listContainerIdsAndNames() {
    docker container ls --format='{{.ID}} {{.Names}}'
}

# filter result using given parameter
listImageTags() {
    docker image ls "$@" --format='{{.Repository}}:{{.Tag}}'
}

# filter result using given parameter
listImageIdsAndTags() {
    docker image ls "$@" --format='{{.ID}} {{.Repository}}:{{.Tag}}'
}

getContainerIdFromName() {
    if [ $# -lt 1 ]; then
        listContainerNames
        echo -e "\n${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mcontainerNameOrHint\e[0m"

        return 1
    fi

    # listContainerIdsAndNames | grep "$@" | awk '{ print $1 }'
    docker ps --filter name="${1}" --quiet
}

getImageIdFromTag() {
    if [ $# -lt 1 ]; then
        listContainerTags
        echo -e "\n${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mimageTagOrHint\e[0m"

        return 1
    fi

    docker image ls "$@" --format='{{.ID}}'
}

removeContainers() {
    if [ $# -lt 1 ]; then
        listContainerNames
        echo -e "\n${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mcontainerNameOrHint\e[0m"

        return 1
    fi

    docker rm --force $(getContainerIdFromName $1)
}

copyFileToContainer() {
    if [ $# -lt 1 ]; then
        listContainerNamesAndIds
        echo -e "\n${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mlocalFileHere containerIdHere containerFileHere\e[0m"

        return 1
    fi

    local localFile="$1"
    local containerId="$2"
    local containerFile="$3"

    docker cp $localFile "$containerId:$containerFile"
}

showContainerIp() {
    if [ -z $1 ]; then
        echo -e "\e[1mContainers:\e[0m\n"
        docker container ls --format='{{.ID}}\t{{.Names}}'
        echo -e "\n${SCRIPT_NAME} showContainerIp \e[33mcontainerIdOrName\e[0m"

        return 1
    fi

    docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$1"
}

showNetworkIp() {
    if [ $# -eq 0 ]; then
        echo -e "\e[1mNetworks:\e[0m\n"
        docker network ls --format='{{.ID}}\t{{.Name}}'
        echo -e "\n${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mnetworkIdOrName\e[0m"

        return 1
    fi

    docker inspect -f "{{json .IPAM.Config }}" "$1" | grep -Po '"Gateway":.*"}]' | grep -Po '(?:[0-9]{1,3}\.){3}[0-9]{1,3}'
}

listImagesAsJson() {
    docker container ls --format='{{json .}}{{ println }}'
}

listImageChildren() {
    if [ -z $1 ]; then
        echo -e "\e[1mImages:\e[0m\n"
        docker image ls --format='{{.ID}}\t{{.Repository}}:{{.Tag}}'
        echo -e "\n${SCRIPT_NAME} listImageChildren \e[33mimageIdOrName\e[0m"

        return 1
    fi

    docker inspect --format='{{.Id}} {{.Parent}}' $(docker images --filter since="$1" --quiet)
}

removeUselessImages() {
    docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
}

removeImages() {
    if [ $# -lt 1 ]; then
        listImageIdsAndTags
        echo -e "\n${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mimageTagOrHint\e[0m"

        return 1
    fi

    local images=$(listImageIdsAndTags | grep -E "$@")
    local imageIds=''
    local id=''

    if [ -z "$images" ]; then
        echo "No image to remove. See ya!"

        return
    fi

    echo -e "\e[1mImages to remove:\e[0m"
    echo "${images}" | awk '{ print $2 }'

    _askConfirmationDefaultYes || return 1

    for image in "$images"; do
        echo "${image}" | awk '{ print $2 }'
        id=$(echo "${image}" | awk '{ print $1; }')
        docker image rm --force "$id"
    done
}

stopAllContainers() {
    docker stop $(docker ps -a -q)
}

# isContainerStarted() {
#     echo TODO
# }

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

"$@"