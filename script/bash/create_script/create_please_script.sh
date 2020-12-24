#! /bin/bash

suffix="nicor"

if [ -n "$1" ]; then
    suffix="$1"
fi

createExecutableFile() {
    touch "$1"
    chmod +x "$1"
}

writeScriptTemplate() {
    cat > "$1" <<END
#! /bin/bash

SCRIPT_NAME=\$(basename \$0)

functionName() {
    echo "Welcome home!"
}

_listAvailableFunctions() {
    cat \$0 | grep -E '^[a-z]+[a-zA-Z0-9]*\(\) \{$' | sed 's#() {\$##'
}

if [ \$# -eq 0 ]; then
    _listAvailableFunctions
    exit
fi

\$@
END
}

fileName="please_${suffix}.sh"
createExecutableFile "$fileName"
writeScriptTemplate "$fileName"
