#! /bin/bash

SCRIPT_NAME=$(basename $0)
SCRIPT_DIRECTORY=$(dirname $0)

fromPhpUnit() {
    sudo sed -i "s/'bg-blue', '#StandWith'/'bg-white', 'hello'/" $(grep -R "'bg-blue', '#StandWith'" . | awk '{ print $1; }' | tr -d ':')
    sudo sed -i "s/'bg-yellow', 'Ukraine'/'bg-white', 'world'/" $(grep -R "'bg-yellow', 'Ukraine'" . | awk '{ print $1; }' | tr -d ':')
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

"$@"
