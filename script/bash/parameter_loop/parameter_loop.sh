#!/bin/bash

## Loop on function parameter to do some actions.
##
## Use "$@" if you want to pass all previous parameters.
##
analyseParameters() {

    while [ ! -z "$1" ]; do
        case "$1" in
            'zog')
                echo "zogzog"
                shift
            ;;
            1)
                echo "case 1"
                shift
            ;;
            2|3)
                echo "case 2 or 3"
                shift
            ;;
            *)
                echo "$1"
                shift
            ;;
        esac
        
    done
    
}

## Add "" around $@ to handle strings containing spaces correctly.
analyseParameters "$@"
