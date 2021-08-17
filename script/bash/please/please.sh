#! /bin/bash

#SCRIPT_NAME=$(basename $0)
SCRIPT_NAME=$(basename $BASH_SOURCE)

searchInFiles() {
    if [ $# -lt 2 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mstringToSearchHere directoryHere\e[0m"
        exit 1
    fi

    grep --dereference-recursive "$@"
}

# Get the last part of a file name
extractFileName() {
    echo ${@##*/}
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
