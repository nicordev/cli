#!/bin/bash

if [ -z "$1" ]; then
    echo "Missing pdf file. Bye."
    exit 1
fi

echo "Splitting file $1..."

pdfseparate "$1" "${2}%d.pdf" && echo "Done. Have a nice day!"
