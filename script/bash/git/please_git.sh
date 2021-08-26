#!/usr/bin/env bash

SCRIPT_NAME=$(basename $0)

_askConfirmationDefaultYes() {
    local answer='yes'
    echo -e "\e[1m$1Continue?\e[0m [YES/no] "
    read answer

    if [[ ${answer,,} =~ ^(n) ]]; then
        return 1
    fi
}

# Checkout or fetch then checkout if branch not found.
checkout() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mbranchName\e[0m"
        exit
    fi

    git checkout "$@" || (git fetch origin && git checkout "$@")
}

showCurrentBranch() {
    git branch --show-current
}

showOtherBranches() {
    git branch | grep --invert-match \* | sed 's#  ##'
}

filterBranches() {
    if [ $# -eq 0 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mcriteriaHere\e[0m"
        exit
    fi

    git branch | grep "$1" | sed 's#^* ##' | sed 's#  ##'
}

deleteBranches() {
    if [ $# -eq 0 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mcriteriaHere\e[0m"
        exit
    fi

    filterBranches "$1"
    _askConfirmationDefaultYes || exit
    git branch -D $(filterBranches "$1")
}

recreateBranchFrom() {
    if [ $# -lt 2 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mbranchToRecreateHere rootBranchHere\e[0m"
        exit
    fi

    local branchToRecreate="$1"
    local temporaryBranchToRecreate="inital_$branchToRecreate"
    local rootBranch="$2"

    echo -e "\e[1m# Remove potential remaining temporary branch \e[33m$temporaryBranchToRecreate\e[0m"
    git branch -D "$temporaryBranchToRecreate"

    echo -e "\e[1m# Rename \e[33m$branchToRecreate\e[0m\e[1m to \e[33m$temporaryBranchToRecreate\e[0m"
    git checkout "$branchToRecreate"
    git branch -m "$temporaryBranchToRecreate"

    echo -e "\e[1m# Select \e[33m$rootBranch\e[0m"
    git checkout "$rootBranch"

    echo -e "\e[1m# Recreate \e[33m$branchToRecreate\e[0m"
    git checkout -b "$branchToRecreate"

    echo -e "\e[1m# Pick commits from \e[33m$temporaryBranchToRecreate\e[0m"
    _askConfirmationDefaultYes || echo 'See ya!' && exit

    git cherry-pick "..$temporaryBranchToRecreate"
    git branch -D "$temporaryBranchToRecreate"
}

showCurrentBranch() {
    git branch --show-current
}

backupCurrentBranch() {
    local currentBranch=$(showCurrentBranch)

    git checkout -b "backup_${currentBranch}"
    git checkout ${currentBranch}
}

pullThenRebaseBranch() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mbranchToPullHere\e[0m"
        exit
    fi

    local initialBranch=$(showCurrentBranch)
    local stashResult=$(git stash)

    git checkout develop &&
    git pull origin develop &&
    git checkout "$initialBranch" &&
    git rebase develop

    if [ 'No local changes to save' == "$stashResult" ]; then
        echo 'No stash pop needed.'
        exit
    fi

    git stash pop
}

editBranchDescription() {
    git branch --edit-description "$@"
}

showBranchDescription() {
    local currentBranch="$1"

    if [ $# -eq 0 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mbranchNameHere\e[0m\n"
        local currentBranch=$(showCurrentBranch)
    fi

    git config "branch.${currentBranch}.description"
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