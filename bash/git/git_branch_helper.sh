#!/bin/bash

filterBranches() {
    git branch | grep "$hint"
}

listBranches() {
    
}

hint="$1"
action="$2"
branches=$(filterBranches)

listBranches

read -p 'Which branch? ' selectedBranch