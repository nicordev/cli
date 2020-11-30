#!/bin/bash

# Rename files to lowercase.
#
# Use * to rename all files in the current directory: rename_file_lower_case.sh *

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

switchToLowercase() {
    tr [:upper:] [:lower:]
}

renameFile() {
    local lowercaseFile=$(echo "$1" | switchToLowercase)

    if isFile "$lowercaseFile"; then
        echo "File $lowercaseFile already exists."
        return 1
    fi

    /bin/mv "$1" "$lowercaseFile"
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