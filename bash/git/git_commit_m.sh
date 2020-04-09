#!/bin/bash

## git_commit_sh commitMessageHere [flagHere]
## 
## Run git commit -m "flagHere: commitMessageHere".
##
## If flagHere is omitted, then the flag will be 'feat'

if [ -z $1 ]
then
    echo 'Please enter a message.'
    exit
fi

flag='feat'

if [ ! -z $2 ]
then
    flag=$2
fi

git commit -m "$flag: $1"