#!/bin/bash

filterBranches() {
    git branch | grep "$1"
}

listBranches() {
    echo $branches
}

hint="$1"
action="$2"
branches=$(filterBranches $hint)

filterBranches $hint
listBranches

# read -p 'Which branch? ' selectedBranch