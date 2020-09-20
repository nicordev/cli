#!/bin/bash

# VSCodium:
#   https://github.com/VSCodium/vscodium
#   https://vscodium.com/

getVsCodium() {
    snap install codium
}

getVsCode() {
    wget 'https://go.microsoft.com/fwlink/?LinkID=760868'
}

if [ "codium" == $1 ]; then
    getVsCodium
    exit
fi

getVsCode