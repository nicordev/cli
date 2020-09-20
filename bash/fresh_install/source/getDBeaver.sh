#!/bin/bash

# DBeaver:
#   https://dbeaver.io/download/

packageFolder='./temporary/dbeaver'

getDBeaver() {
    wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb --directory-prefix="$packageFolder"
}

installDBeaver() {
    local temporaryPackageFileName="$packageFolder/dbeaver.deb"

    mv "$packageFolder"/* "$temporaryPackageFileName"
    apt-get install "$temporaryPackageFileName" -y
}

removePackageFolder() {
    
}

getDBeaver
installDBeaver
