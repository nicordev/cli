#!/bin/bash

# Insomnia:
#   https://support.insomnia.rest/article/23-installation#linux

getInsomnia() {
    # Add to sources
    echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
        | tee -a /etc/apt/sources.list.d/insomnia.list

    # Add public key used to verify code signature
    wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
        | apt-key add -

    # Refresh repository sources and install Insomnia
    apt-get update
    apt-get install insomnia -y
}

getInsomnia