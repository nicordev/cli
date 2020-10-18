#!/bin/bash

styleStrong="\e[1m"
styleNormal="\e[0m"

filterBranches() {
    git branch | grep "$1" | sed 's#^* ##' | sed 's#  ##'
}

listAvailableBranches() {
    avalaibleBranches=$(filterBranches $hint)

    for branch in "$avalaibleBranches"; do
        echo "$branch"
    done
}

getActiveBranch() {
    git branch | grep '^* ' | sed 's#^* ##'
}

printWithStyle() {
    echo -ne "${2}${1}${styleNormal}"
}

printStrong() {
    printWithStyle "$1" ${styleStrong}
}

printNormal() {
    echo -ne "$1"
}

askWhichBranchToUse() {
    printStrong "\nWhich branch? "
    read branchToSwitch

    if [ -z "$branchToSwitch" ]; then
        echo 'No branch selected. See ya!'
        exit
    fi
}

switchBranch() {
    printStrong "Switching to $1...\n"
    git switch "$1"
}

hint="$1"
activeBranch=$(getActiveBranch)

printStrong "Active branch: "
printNormal "${activeBranch}\n\n"
printStrong "Available branches :\n"
listAvailableBranches
askWhichBranchToUse
switchBranch "$branchToSwitch"