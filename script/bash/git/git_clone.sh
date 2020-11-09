#!/bin/bash

host="https://github.com"
user="nicordev"
repository="$1"

cloneRepository() {
    git clone "$host/$user/$repository" "$1"
}

if [ -z "$1" ]; then
    echo "Which repository?"
    read repository
fi

if [ -z "$repository" ]; then
    echo "See ya!"
    exit
fi

cloneRepository "$repository" "$2"