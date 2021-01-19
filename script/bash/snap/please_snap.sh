#! /bin/bash

SCRIPT_NAME=$(basename $0)

# Use with sudo
retain2VersionOnly() {
    snap set system refresh.retain=2
}

# Removes old revisions of snaps
# CLOSE ALL SNAPS BEFORE RUNNING THIS
# Use with sudo
removeOldRevisionsOfSnaps() {
    set -eu
    LANG=en_US.UTF-8 snap list --all | awk '/disabled/{print $1, $3}' |
        while read snapname revision; do
            snap remove "$snapname" --revision="$revision"
        done
}

# Display the source code of this file
howItWorks() {
    echo -e "\e[32m Welcome home! \e[0m \n You are executing: \e[33m ${FUNCNAME[0]} \e[0m with $# parameter(s)"
    cat $0
}

# List all functions that do not begin with an underscore _
_listAvailableFunctions() {
    cat $0 | grep -E '^[a-z]+[a-zA-Z0-9]*\(\) \{$' | sed 's#() {$##'
}

if [ $# -eq 0 ]; then
    _listAvailableFunctions
    exit
fi

$@
