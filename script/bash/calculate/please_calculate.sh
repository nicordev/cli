#! /bin/bash

SCRIPT_NAME=$(basename $0)

# TODO: improve using `file` command to fetch image dimensions
imageHeight() {
    if [ $# -lt 3 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33minitialWidth initialHeight finalWidth\e[0m"
        exit
    fi

    initialWidth=$1
    initialHeight=$2
    finalWidth=$3
    finalHeight=$(( $finalWidth * initialHeight / initialWidth ))

    echo $finalHeight
}

tva() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mrawPrice [tva = 20]\e[0m"
        return
    fi

    python3 -c "print($1 + $1 * ${2:-20} / 100)"
}

sum() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mnumber [...number]\e[0m"
        return
    fi

    echo $@ | tr " " "+" | bc
}

substract() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mnumber [...number]\e[0m"
        return
    fi

    echo $@ | tr " " "-" | bc
}

multiply() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mnumber [...number]\e[0m"
        return
    fi

    echo $@ | tr " " "*" | bc
}

divide() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mnumber [...number]\e[0m"
        return
    fi

    echo $@ | tr " " "/" | bc
}

# Display the source code of this file
howItWorks() {
    cat $0
}

# List all functions that do not begin with an underscore _
_listAvailableFunctions() {
    cat $0 | grep -E '^[a-z]+[a-zA-Z0-9_]*\(\) \{$' | sed 's#() {$##' | sort
}

if [ $# -eq 0 ]; then
    _listAvailableFunctions
    exit
fi

$@
