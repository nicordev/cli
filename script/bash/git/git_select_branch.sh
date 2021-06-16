#!/bin/bash

styleStrong="\e[1m"
styleNormal="\e[0m"

getActiveBranch() {
    git branch | grep '^* ' | sed 's#^* ##'
}

showActiveBranch() {
    echo -ne "${styleStrong}Active branch: ${styleNormal}"
    echo -e "$(getActiveBranch)\n"
}

filterBranches() {
    git branch | grep "$1" | sed 's#^* ##' | sed 's#  ##'
}

switchBranch() {
    echo -e "\n${styleStrong}Switching to $1...${styleNormal}"
    git switch "$1"
}

selectBranch() {
    echo -e "${styleStrong}Available branches :${styleNormal}"

    avalaibleBranches=$(filterBranches $hint)
    PS3="Which number? "

    select branchToSwitch in $avalaibleBranches
    do
        switchBranch "$branchToSwitch"
        exit
    done
}

hint="$1"
showActiveBranch
selectBranch