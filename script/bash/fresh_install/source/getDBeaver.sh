#!/bin/bash

# DBeaver:
#   https://dbeaver.io/download/

packageFolder='./temporary/dbeaver'

getDBeaver() {
    wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb --directory-prefix="$packageFolder"
}

installDBeaver() {
    # Rename package file
    local temporaryPackageFileName="$packageFolder/dbeaver.deb"
    mv "$packageFolder"/* "$temporaryPackageFileName"
    # Install package
    apt-get install "$temporaryPackageFileName" -y
}

removePackageFolder() {
    rm -rf $packageFolder
}

getDBeaver
installDBeaver
removePackageFolder