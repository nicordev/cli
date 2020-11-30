#!/bin/bash

# >>>>>>>>>>>>>>>>>>>>>>>> functions >>>>>>>>>>>>>>>>>>>>>>>>

showHelp() {
    if [ $# -eq 0 ]
    then
        echo "$(basename $0) file"
        exit 1
    fi
}

checkFile() {
    if [ ! -f "$file" ]
    then
        echo "$file is not a file."
        exit 2
    fi
}

switchToSnakeCase() {
    tr [:blank:] '_'
}

renameFile() {
    snakeCaseFile=$(echo "$file" | switchToSnakeCase)

    if [ -f snakeCaseFile ]; then
        echo "Error - File already exists!"
        exit 3
    fi

    /bin/mv "$file" $snakeCaseFile
}

# <<<<<<<<<<<<<<<<<<<<<<<< functions <<<<<<<<<<<<<<<<<<<<<<<<

showHelp $@

file="$1"
checkFile
renameFile