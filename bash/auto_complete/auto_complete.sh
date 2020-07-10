#!/bin/bash

# Title:         auto_complete
# Description:   a script to show how to use auto-complete feature.
# Author:        nicolas renvoisé <nicolas.renvoise.dev@gmail.com>
# Date:          2020-07-01
# Version:       1.0.0


# >>>>>>>>>>>>>>>>>>>>>>>> functions >>>>>>>>>>>>>>>>>>>>>>>>

makeFixedAutoCompleteList() {
    compgen -W "zogzog --help --verbose --version" -- "$1"
}

makeAutoCompleteList() {
    echo "$@"
    echo 'list:'
    autoCompleteList=$(compgen -W "$@" -- "$1")
    echo "$autoCompleteList"
}

# <<<<<<<<<<<<<<<<<<<<<<<< functions <<<<<<<<<<<<<<<<<<<<<<<<


# makeAutoCompleteList $@
list=$(compgen -W "zogzog --help --verbose --version" -- "$1")
echo "$list"