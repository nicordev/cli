#!/bin/bash

read -p 'Ready to upgrade packages? Y|n ' isReadyToUpgrade

if [ -z "$isReadyToUpgrade" ] || [ "$isReadyToUpgrade" == "y" ] || [ "$isReadyToUpgrade" == "Y" ] || [ "$isReadyToUpgrade" == "yes" ]; then
    sudo apt-get update
    sudo apt-get upgrade -y
    echo -e "\n\e[1mUpgrade is done!\e[0m"
fi

echo 'Bye!'