#!/bin/bash

packageFolder='./packageFolder'

preparePackageFolder() {

    if [ -z "$1" ]; then
        packageFolder="$1"
    fi

    if [ ! -d "$packageFolder" ]; then
        mkdir "$packageFolder"
    fi
}

getPostman() {
    wget 'https://dl.pstmn.io/download/latest/linux64' --directory-prefix="$packageFolder"
}

removePackageFolder() {
    if [ ! -d "$packageFolder" ]; then
        rm -rf "$packageFolder"
    fi
}

preparePackageFolder $1
getPostman
removePackageFolder