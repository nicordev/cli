#!/bin/bash

# Description:   make a git reset --hard to go back to a previous state of the current branch.

isClearedToReset=false
styleStrong="\e[1m"
styleReset="\e[0m"

# >>>>>>>>>>>>>>>>>>>>>>>> function >>>>>>>>>>>>>>>>>>>>>>>>

listCommits() {
    git log --oneline --graph # --pretty="%h %cd %s"
}

showCommit() {
    commit=$(listCommits | grep "$1")


    if [ -z "$commit" ]; then
        echo "Unknown commit. See ya!"
        exit
    fi

    echo "$commit"
}

askTargetCommit() {
    listCommits
    echo -e "\n${styleStrong}You are going to remove all changes made after a precise commit.${styleReset}"
    read -p "Which commit? " targetCommit

    if [ -z "$targetCommit" ]; then
        echo "Have a nice day!"
        exit
    fi
}

askConfirmationBeforeReset() {
    echo -e "\n${styleStrong}You are about to remove your changes made after this commit:${styleReset}"
    showCommit "$targetCommit"
    echo ""
    read -p "Continue? y/N " answer

    if [ "$answer" == "y" ] || [ "$answer" == "yes" ]; then
        isClearedToReset=true
    fi
}

resetToTargetCommit() {
    echo "Resetting to $targetCommit..."
    git reset --hard "$targetCommit"
}

# <<<<<<<<<<<<<<<<<<<<<<<< function <<<<<<<<<<<<<<<<<<<<<<<<

if [ -z "$1" ]; then
    askTargetCommit
else
    targetCommit="$1"
fi

askConfirmationBeforeReset

if [ "$isClearedToReset" != true ]; then
    echo 'Reset aborted.'
    exit
fi

resetToTargetCommit