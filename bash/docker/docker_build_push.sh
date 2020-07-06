#!/bin/bash

folder="."
canBuild="n"

# >>>>>>>>>>>>>>>>>>>>>>>> functions >>>>>>>>>>>>>>>>>>>>>>>>

askTag() {
    read -p "What tag? " tag
}

askDockerfile() {
    read -p "What Dockerfile? " dockerfile
}

askFolder() {
    read -p "What folder? " folder
}

build() {
    if [ -z "$dockerfile" ]; then
        docker build --pull -t "$tag" "$folder"
        return
    fi
    docker build --pull -t "$tag" -f "$dockerfile" "$folder"
}

push() {
    docker push "$tag"
}

# <<<<<<<<<<<<<<<<<<<<<<<< functions <<<<<<<<<<<<<<<<<<<<<<<<

if [ "$1" == "--build" ]; then
    askTag
    askDockerfile
    askFolder
    echo "I'm about to build $tag using $dockerfile $folder."
    read -p "Continue? y/N " canBuild

    if [ "$canBuild" != "y" ]; then
        echo "Build canceled."
        exit
    fi

    build
elif [ "$1" == "--push" ]; then
    askTag
    push
else
    echo "Use --build or --push"
fi
