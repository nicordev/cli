#!/bin/bash

# DBeaver:
#   https://dbeaver.io/download/

temporaryFolder='./debianPackageTemporaryFolder'
quiet=''

styleNormal="\e[0m"
styleStrong="\e[1m"
styleSuccess="\e[32m"
styleCaution="\e[33m"
styleFailure="\e[31m"

fetchPackage() {
    echo -e "${styleCaution}Fetching the package...${styleNormal}"
    wget "$1" --directory-prefix="$temporaryFolder"
}

installPackage() {
    local temporaryPackageFileName="$temporaryFolder/package.deb"
    mv "$temporaryFolder"/* "$temporaryPackageFileName"
    apt-get install "$temporaryPackageFileName" $quiet
}

removeTemporaryFolder() {
    rm -rf "$temporaryFolder" || return
}

if [ -z "$1" ]; then
    echo -e "${styleFailure}Missing package url as first parameter of the command.${styleNormal}"
    echo -e "Please try again."
    exit 1
fi

if [ "$2" == -y ]; then
    quiet='-y'
fi

removeTemporaryFolder
fetchPackage "$1"
installPackage
removeTemporaryFolder