#!/usr/bin/env bash

SCRIPT_NAME=$(basename $0)

_askConfirmationDefaultYes() {
    local answer='yes'
    echo -e "\e[1m$1Continue?\e[0m [YES/no] "
    read answer

    if [[ ${answer,,} =~ ^(n|no)$ ]]; then
        return 1
    fi
}

# Checkout or fetch then checkout if branch not found.
checkout() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mbranchName\e[0m"
        exit 1
    fi

    git checkout "$@" || (git fetch origin && git checkout "$@")
}

showCurrentBranch() {
    git branch | grep \* | sed 's#^* ##'
}

showOtherBranches() {
    git branch | grep --invert-match \* | sed 's#  ##'
}

filterBranches() {
    if [ $# -eq 0 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mcriteriaHere\e[0m"
        exit 1
    fi

    git branch | grep "$1" | sed 's#^* ##' | sed 's#  ##'
}

deleteBranches() {
    if [ $# -eq 0 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mcriteriaHere\e[0m"
        exit 1
    fi

    filterBranches "$1"
    _askConfirmationDefaultYes || exit
    git branch -D $(filterBranches "$1")
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