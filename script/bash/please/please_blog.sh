#! /bin/bash

#SCRIPT_NAME=$(basename $0)
#SCRIPT_DIRECTORY=.
SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_DIRECTORY=$(dirname $BASH_SOURCE)
EXIT_CODE_MISSING_BLOG_DIRECTORY=111
LOCATION_FILE="$HOME/${SCRIPT_NAME}_location"
TEXT_EDITOR='code'
BLOG_LOCATION_KEY='blog'

_createLocationFileIfNoneExists() {
    if [ ! -f "$LOCATION_FILE" ]
    then
        echo "$BLOG_LOCATION_KEY=" > $LOCATION_FILE
    fi
}

_getLocation() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mlocationNameHere\e[0m"

        return 1
    fi

    cat $LOCATION_FILE | sed --quiet "s/^$1=\([^\n]*\)/\1/p"
}

_getToday() {
    date '+%Y-%m-%d'
}

_setBlogDirectory() {
    BLOG_DIRECTORY="$(_getLocation $BLOG_LOCATION_KEY)"
    BLOG_DRAFT_DIRECTORY="$BLOG_DIRECTORY/_drafts"
    BLOG_POST_DIRECTORY="$BLOG_DIRECTORY/_posts"

    if [ ! -d "$BLOG_DIRECTORY" ]
    then
        exit $EXIT_CODE_MISSING_BLOG_DIRECTORY
    fi
}

_getCurrentUserName() {
    id -un
}

browseBlogOnline() {
    echo "https://nicordev.gitlab.io/blog/"
}

createDraft() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mtitle [author] [layout]\e[0m"

        return 1
    fi

    local draftFileName="$(_getToday)-$1"

    echo "---
layout: ${3:-post}
author: ${2:-$(_getCurrentUserName)}
---
" > "$BLOG_DRAFT_DIRECTORY/$draftFileName"

    echo "$BLOG_DRAFT_DIRECTORY/$draftFileName"
}

editBlog() {
    $TEXT_EDITOR $BLOG_DIRECTORY
}

listDrafts() {
    for file in "$BLOG_DRAFT_DIRECTORY"/*
    do
        echo $file
    done
}

listPosts() {
    for file in "$BLOG_POST_DIRECTORY"/*
    do
        echo $file
    done
}

editDraft() {
    if [ $# -lt 1 ]; then
        listDrafts
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mdraftFile\e[0m"

        return 1
    fi

    $TEXT_EDITOR "$@"
}

moveDraftToPost() {
    if [ $# -lt 1 ]; then
        listDrafts
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mdraftFile [draftFile]\e[0m"

        return 1
    fi

    while [ ! -z "$1" ]
    do
        mv "$1" "$BLOG_POST_DIRECTORY"
        shift
    done

    listPosts
}

movePostToDraft() {
    if [ $# -lt 1 ]; then
        listPosts
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mpostFile [postFile]\e[0m"

        return 1
    fi

    while [ ! -z "$1" ]
    do
        mv "$1" "$BLOG_DRAFT_DIRECTORY"
        shift
    done

    listDrafts
}

fixLinks() {
    addMissingSlashToLinks "$@"
    addAbsoluteUrlToLinks "$@"
}

addMissingSlashToLinks() {
    if [[ "$1" == '-i' ]]
    then
        local updateFile='-i'
        shift
    fi

    sed -i 's#src="\([^"]*\)"#src="/\1"#g' "$@"
    sed -i 's#href="\([^"]*\)"#href="/\1"#g' "$@"
}

addAbsoluteUrlToLinks() {
    if [[ "$1" == '-i' ]]
    then
        local updateFile='-i'
        shift
    fi

    sed -i 's#src="\([^"]*\)"#src="{{ "\1" | absolute_url }}"#g' "$@"
    sed -i 's#href="\([^"]*\)"#href="{{ "\1" | absolute_url }}"#g' "$@"
}

addMissingQuotes() {
    if [[ "$1" == '-i' ]]
    then
        local updateFile='-i'
        shift
    fi

    sed $updateFile 's#src="{{ \([^"]*\) | absolute_url }}"#src="{{ "\1" | absolute_url }}"#g' "$@"
    sed $updateFile 's#href="{{ \([^"]*\) | absolute_url }}"#href="{{ "\1" | absolute_url }}"#g' "$@"
}

_handleExit() {
    if [ $? == $EXIT_CODE_MISSING_BLOG_DIRECTORY ]; then
        echo "set blog directory path in:
$LOCATION_FILE"
    fi
}

# Display the source code of this file
howItWorks() {
    cat $0
}

# List all functions that do not begin with an underscore _
_listAvailableFunctions() {
    cat $0 | grep -E '^[a-z]+[a-zA-Z0-9_]*\(\) \{$' | sed 's#() {$##' | sort
}

trap _handleExit exit err

_createLocationFileIfNoneExists

if [ $# -eq 0 ]; then
    _listAvailableFunctions
    exit
fi

_setBlogDirectory

"$@"
