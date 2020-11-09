#!/bin/bash

## Build an image then run a container from it in detached mode.

imageTag="$1"
dockerfileFolder="$2"
containerName="$3"

if [ -z $dockerfileFolder ]; then
    dockerfileFolder="."
fi

if [ ! -z $containerName ]; then
    containerName="--name $containerName"
fi

docker build -t $imageTag $dockerfileFolder
docker run -d $imageTag $containerName