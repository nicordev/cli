#! /bin/bash

SCRIPT_NAME=$(basename $0)

# TODO: improve using `file` command to fetch image dimensions
imageHeight() {
    if [ $# -lt 3 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33minitialWidth initialHeight finalWidth\e[0m"
        exit
    fi

    initialWidth=$1
    initialHeight=$2
    finalWidth=$3
    finalHeight=$(( $finalWidth * initialHeight / initialWidth ))

    echo $finalHeight
}

# Display the source code of this file
howItWorks() {
    cat $0
}

# List all functions that do not begin with an underscore _
_listAvailableFunctions() {
    cat $0 | grep -E '^[a-z]+[a-zA-Z0-9]*\(\) \{$' | sed 's#() {$##'
}

if [ $# -eq 0 ]; then
    _listAvailableFunctions
    exit
fi

$@
