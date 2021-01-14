#! /bin/bash

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

_listAvailableFunctions() {
    cat $0 | grep -E '^[a-z]+[a-zA-Z0-9]*\(\) \{$' | sed 's#() {$##'
}

if [ $# -eq 0 ]; then
    _listAvailableFunctions
    exit
fi

$@
