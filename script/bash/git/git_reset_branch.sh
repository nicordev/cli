#!/bin/bash

BACKUP_BRANCH="git_clean_backup_branch"
targetBranch="$1"

styleNormal="\e[0m"
styleStrong="\e[1m"
styleSuccess="\e[32m"
styleCaution="\e[33m"
styleFailure="\e[31m"

askTargetBranch() {
    if [ -z $targetBranch ]; then
        echo -e "${styleStrong}Which branch do you want to reset?${styleNormal}"
        read targetBranch
    fi
}

abortMerge() {
    git merge --abort || echo "${styleCaution}No merge to abort. Continue...${styleNormal}"
}

selectBranch() {
    git checkout $1
}

createBackupBranch() {
    git checkout -b $BACKUP_BRANCH && return || echo "${styleCaution}Backup branch already exists. Selecting it...${styleNormal}"
    selectBranch $BACKUP_BRANCH
}

deleteBranch() {
    git branch -D $1
}

askTargetBranch
abortMerge
createBackupBranch
deleteBranch $targetBranch
selectBranch $targetBranch
deleteBranch $BACKUP_BRANCH
echo "${styleSuccess}Done. Have a nice day!${styleNormal}"