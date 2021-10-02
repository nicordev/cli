#! /bin/bash

#SCRIPT_NAME=$(basename $0)
#SCRIPT_DIRECTORY=$(dirname $0)
SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_DIRECTORY=$(dirname $BASH_SOURCE)

_askConfirmationDefaultYes() {
    echo -e "\e[1mContinue?\e[0m [YES/no] "
    read answer

    if [[ ${answer,,} =~ ^n ]]; then
        echo "no"

        return 1
    fi

    echo "yes"
    return 0
}

_askConfirmationDefaultNo() {
    echo -e "\e[1mContinue?\e[0m [yes/NO] "
    read answer

    if [[ ${answer,,} =~ ^y ]]; then
        echo "yes"
        return 0
    fi

    echo "no"

    return 1
}

appendToEndOfFile() {
    if [ $# -lt 2 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mfileName contentToAppend\e[0m"

        return 1
    fi

    sed -i '$a\'"$2" "$1"
}

getAsciiCodeFromCharacter() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mcharacterHere\e[0m"
        exit
    fi

    printf "%d\n" "'$1'"
}

getCharacterFromAsciiCode() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33masciiCodeHere\e[0m"
        exit
    fi

    awk -v char=65 "BEGIN { printf \"%c\n\", $1; exit }"
}

getFileLastLine() {
    tail --lines=1 "$@"
}

getFileFirstLine() {
    head --lines=1 "$@"
}

getLineContainingPattern() {
    if [ $# -lt 2 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mfileNameHere patternHere\e[0m"
        exit
    fi
    cat --number "$1" | grep --perl-regexp "$2" | awk '{print $1;}'
}

createDummyFile() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mfileNameHere contentHere\e[0m"
        echo -e "\n\e[1mCreating dummyFile.\e[0m"
        _askConfirmationDefaultNo || exit
    fi

    local fileName="$1"
    local content="$2"

    echo ${content:-"apple
orange
pear
raspberry
cherry"} > ${fileName:-"dummyFile"}
}

searchInFiles() {
    if [ $# -lt 2 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mstringToSearchHere directoryHere\e[0m"

        return 1
    fi

    grep --dereference-recursive "$@"
}

trackFileChanges() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mfileNameHere\e[0m"

        return 1
    fi

    tail --follow=name --retry "$1"
}

# Get the last part of a file name
extractFileName() {
    echo ${@##*/}
}

openHtmlContent() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mhtmlContentHere\e[0m"

        return 1
    fi
    local temporaryFile='/tmp/please_openClipboardContentInFirefox.html'

    echo "$@" > "$temporaryFile"
    firefox "$temporaryFile"
}

# Display the source code of this file
howItWorks() {
    cat $0
}

# List all functions that do not begin with an underscore _
_listAvailableFunctions() {
    cat $0 | grep -E '^[a-z]+[a-zA-Z0-9]*\(\) \{$' | sed 's#() {$##' | sort
}

if [ $# -eq 0 ]; then
    _listAvailableFunctions
    exit
fi

$@
