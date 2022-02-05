#! /bin/bash

readonly SCRIPT_NAME=$(basename $BASH_SOURCE)
readonly SCRIPT_DIRECTORY=$(dirname $BASH_SOURCE)
readonly HISTORY_DIRECTORY=${HISTORY_DIRECTORY:-/tmp/please_clipboard_history}
readonly SELECTION="${SELECTION:-clipboard}"

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

clearHistory() {
    _askConfirmationDefaultYes || return 1
    rm -rf "$HISTORY_DIRECTORY"
}

createHistoryDirectory() {
    if [ ! -d "$HISTORY_DIRECTORY" ]
    then
        mkdir "$HISTORY_DIRECTORY"
    fi
}

showHistory() {
    i=0
    for file in $HISTORY_DIRECTORY/*
    do
        if [ ! -f "$file" ]
        then
            continue
        fi

        (( ++i ))
        fileExcerpt=$(head $file)
        printf "
\e[1m$i\e[0m
$fileExcerpt
"
    done
}

paste() {
    xclip -out -selection "${SELECTION}"
}

copy() {
    xclip -in -selection "${SELECTION}"
    i=0
    for file in $HISTORY_DIRECTORY/*
    do
        if [ ! -f "$file" ]
        then
            continue
        fi

        (( ++i ))
    done

    (( ++i ))
    paste > "$HISTORY_DIRECTORY/clip_$i"
}

copyFromHistory() {
    if [ $# -lt 1 ]
    then
        showHistory
        printf "
${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mhistoryFileNumber\e[0m
"
        return 1
    fi

    i=0
    for file in $HISTORY_DIRECTORY/*
    do
        if [ ! -f "$file" ]
        then
            continue
        fi

        (( ++i ))

        if [ "$1" -eq "$i" ]
        then
            cat "$file" | xclip -in -selection "${SELECTION}"

            return
        fi
    done

    echo "nothing found."
    return 1
}

editMe() {
    vim $0
}

# Display the source code of this file
howItWorks() {
    if [ $# -lt 1 ]; then
        less "$0"

        return
    fi

    less --pattern="$@" "$0"
}

# List all functions that do not begin with an underscore _
_listAvailableFunctions() {
    cat $0 | grep -E '^[a-z]+[a-zA-Z0-9_]*\(\) \{$' | sed 's#() {$##' | sort
}

if [ $# -eq 0 ]; then
    _listAvailableFunctions
    exit
fi

createHistoryDirectory

"$@"
