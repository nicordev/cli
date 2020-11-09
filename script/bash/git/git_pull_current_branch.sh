#!/bin/bash

getActiveBranch() {
    git branch | grep '^* ' | sed 's#^* ##'
}

git pull origin $(getActiveBranch)
