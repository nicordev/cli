#!/bin/bash

# DBeaver:
#   https://dbeaver.io/download/

temporaryFolder='./temporary/dbeaver'

getDBeaver() {
    # wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb --directory-prefix="$temporaryFolder"
}

installDBeaver() {
    local temporaryPackageFileName="$temporaryFolder/dbeaver.deb"
    mv "$temporaryFolder"/* "$temporaryPackageFileName"
    apt-get install "$temporaryPackageFileName" -y
}

getDBeaver
installDBeaver
