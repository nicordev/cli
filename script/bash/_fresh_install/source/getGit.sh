#!/bin/bash

# Git:
#   https://git-scm.com/download/linux
#
# $1 for username
# $2 for email

gitUsername='nicor'
gitEmail='nicolas.renvoise.dev@gmail.com'

getGit() {
    apt-get install -y git
    git config --global user.name "$gitUsername"
    git config --global user.email "$gitEmail"
}

if [ -z "$1" ]; then
    gitUsername="$1"
fi

if [ -z "$2" ]; then
    gitEmail="$2"
fi

getGit