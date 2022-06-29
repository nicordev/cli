#! /bin/bash

SCRIPT_NAME=$(basename $0)
SCRIPT_DIRECTORY=$(dirname $0)

fromPhpUnit() {
    local filesWithPropaganda=$(grep --dereference-recursive --files-with-matches '#StandWith' vendor)

    for file in $filesWithPropaganda
    do
        sudo sed -i \
            -e "s/'bg-blue', '#StandWith'/'bg-white', 'hello'/" \
            -e "s/'bg-yellow', 'Ukraine'/'bg-white', 'world'/" \
            -e 's/#StandWith/hello/' \
            -e 's/Ukraine/world/' \
            $file
    done
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
