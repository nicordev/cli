#!/bin/bash

service="$1"
port="$2"
tabSize="$3"

initTab() {
    for ((i=1; i <= $tabSize; i++)); 
        do echo -n ' '; 
    done
}

tab=$(initTab $tabSize)

addPortToDockerComposeFile() {
    sed "s#$service:#$service:\n${tab}${tab}ports:\n${tab}${tab}${tab}- $port#" -i docker-compose.yml
}

