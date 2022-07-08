#!/usr/bin/env bash

readonly SCRIPT_NAME=$(basename $0)
readonly MAX_COUNT="${MAX_COUNT:-15}"
readonly BOOKMARKS_FILE="$HOME/please_git_bookmarks"

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

changeGitHubToGitlabOrigin() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mprojectName [branchName]\e[0m"
        exit
    fi

    git remote rename origin origin-github
    git remote add origin "https://gitlab.com/nicordev/${1}.git"
    git push --set-upstream origin ${2:-master}
}

createGitlabMergeRequest() {
    local remote=${remote:-origin}

    if [ $# -lt 2 ]; then
        echo -e "
\e[35mremote=$remote branchToPush=$branchToPush\e[0m ${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mtargetBranch title [description]\e[0m
"
        return
    fi

    git push \
        -o merge_request.create \
        -o merge_request.remove_source_branch \
        -o merge_request.target="$1" \
        -o merge_request.title="$2" \
        -o merge_request.description="$3" \
        $remote ${branchToPush:-$(showCurrentBranch)}
}

showCurrentBranch() {
    git branch --show-current
}

showOtherBranches() {
    git branch | grep --invert-match \* | sed 's#  ##'
}

listBranchNames() {
    git branch --format='%(refname:short)'
}

filterBranches() {
    if [ $# -eq 0 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mcriteriaHere\e[0m"
        exit
    fi

    listBranchNames | grep "$1"
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

deleteAllBranchesBut() {
    if [ $# -lt 1 ]
    then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mbranchToKeep [...branchToKeep]\e[0m"
        return
    fi

    _askConfirmationDefaultYes || exit

    for branch in $(listBranchNames)
    do
        # skip branches to keep
        for branchToKeep in $@
        do
            if [ "$branch" = "$branchToKeep" ]
            then
                continue 2
            fi
        done

        git branch -D $branch
    done
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

fetchOrigin() {
    git fetch origin
}

resetCurrentBranchToOrigin() {
    local readonly CURRENT_BRANCH=$(showCurrentBranch)

    fetchOrigin
    git reset --hard "origin/$CURRENT_BRANCH"
}

backupCurrentBranch() {
    local currentBranch=$(showCurrentBranch)

    git checkout -b "backup_${currentBranch}"
    git checkout ${currentBranch}
}

checkoutPreviousBranch() {
    git checkout -
}

pullThenRebaseBranch() {
    if [ $# -lt 1 ]; then
        git branch | grep "$HINT"
        printf "
\e[34mHINT=\e[0m ${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mbranchToPullHere\e[0m
"
        return
    fi

    local branchToPull="$1"

    checkout "$branchToPull" &&
    git pull origin "$branchToPull" &&
    checkoutPreviousBranch &&
    git rebase "$branchToPull"
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

listLogs() {
    git log --oneline --graph --max-count=$MAX_COUNT
}

removeCommit() {
    if [ $# -lt 1 ]; then
        listLogs
        printf "
\e[34mMAX_COUNT=$MAX_COUNT\e[0m ${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mcommitShaHere\e[0m
"
        return
    fi

    set -x
    local initialBranch=$(git branch --show-current)
    local commitSha="$1"
    git checkout "${commitSha}~1" && \
    git checkout -B pleaseGitRemoveCommit && \
    git cherry-pick "$commitSha".."$initialBranch" && \
    git branch -mf "$initialBranch"
    git log --oneline --graph --max-count=$maxCount
    set +x
}

resetCurrentBranchAsRemote() {
    if [ $# -lt 1 ]; then
        printf "
${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mremote\e[0m
"
        return
    fi

    local remote="$1"
    local currentBranch=$(showCurrentBranch)

    git reset --hard "$remote/$currentBranch"
}

resetCurrentBranchAsOrigin() {
    resetCurrentBranchAsRemote origin
}

bookmarkCurrentBranch() {
    bookmarkBranch $(showCurrentBranch) "$@"
}

bookmarkBranch() {
    local comment=""
    if [ $# -lt 1 ]
    then
        printf "
${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mbranchNameHere\e[0m
"
        return
    fi

    local branch="$1"
    shift

    if [ "$2" ]
    then
        comment=" # $@"
    fi

    echo -e "git checkout \e[35m$branch\e[0m$comment" >> "$BOOKMARKS_FILE"
}

listBookmarks() {
    cat "$BOOKMARKS_FILE"
}

editBookmarks() {
    vim "$BOOKMARKS_FILE"
}

stashCommit() {
    if [ $# -lt 2 ]
    then
        listLogs
        printf "
\e[34mMAX_COUNT=$MAX_COUNT\e[0m ${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mcommitShaHere stashMessage\e[0m
"
        return
    fi

    git status
    echo 'Continue?'

    local commitSha="$1"
    local stashMessage="$2"
    local initialBranch=$(git branch --show-current)
    _askConfirmationDefaultYes || return

    set -x
    git checkout "${commitSha}~1" && \
    git cherry-pick --no-commit "$commitSha" && \
    git stash push -m "$stashMessage" && \
    git checkout "$initialBranch"
    set +x
}

# Display the source code of this file
howItWorks() {
    less $0
}

# List all functions that do not begin with an underscore _
_listAvailableFunctions() {
    cat $0 | grep -E '^[a-z]+[a-zA-Z0-9_]*\(\) \{$' | sed 's#() {$##' | sort
}

if [ $# -eq 0 ]; then
    _listAvailableFunctions
    exit
fi

"$@"