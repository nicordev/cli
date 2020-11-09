#!/bin/bash

elementsToKeep='remove_except.sh, sarah, sarahFolder'

listElementsToRemove() {
    formattedElementsToKeep=$(echo $elementsToKeep | sed "s#, #\\\|#g")
    ls --all | grep --invert-match "$formattedElementsToKeep"
}

remove() {
    echo "$elementsToRemove"
    rm -rf $(listElementsToRemove)
}

touch zog
touch sarah
touch .zogzog
mkdir --parent zogFolder
mkdir --parent sarahFolder

remove

mkdir --parent zogFolder
mkdir --parent sarahFolder

remove
