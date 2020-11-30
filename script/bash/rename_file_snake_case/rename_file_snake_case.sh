#!/bin/bash

# >>>>>>>>>>>>>>>>>>>>>>>> functions >>>>>>>>>>>>>>>>>>>>>>>>

showHelp() {
    if [ $# -eq 0 ]
    then
        echo "$(basename $0) file"
        exit 1
    fi
}

isFile() {
    [ -f "$1" ]
}

switchToSnakeCase() {
    tr [:blank:] '_'
}

renameFile() {
    local snakeCaseFile=$(echo "$1" | switchToSnakeCase)

    if isFile "$snakeCaseFile"; then
        echo "File $snakeCaseFile already exists."
        return 1
    fi

    /bin/mv "$1" "$snakeCaseFile"
}

# <<<<<<<<<<<<<<<<<<<<<<<< functions <<<<<<<<<<<<<<<<<<<<<<<<

showHelp $@

while [[ $# > 0 ]]; do
    if ! isFile "$1"; then
        echo "$1 is not a file."
        shift
        continue
    fi
    renameFile "$1"
    shift
done

echo 'Done. Have a nice day!'