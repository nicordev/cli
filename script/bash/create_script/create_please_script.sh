#! /bin/bash

suffix=$(id -un) # Get current user name

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

# readonly SCRIPT_NAME=\$(basename \$0)
# readonly SCRIPT_DIRECTORY=$(dirname \$0)
readonly SCRIPT_NAME=\$(basename \$BASH_SOURCE)
readonly SCRIPT_DIRECTORY=\$(dirname \$BASH_SOURCE)
readonly EXIT_CODE_BYE=187

functionName() {
    if [ \$# -lt 1 ]
    then
        echo -e "\${SCRIPT_NAME} \${FUNCNAME[0]} \e[33mparameterName\e[0m"

        return 1
    fi
}

_handleExit() {
    # remember last exit code has the next 'if' statement will override it
    lastExitCode=\$?

    if [ '1' -eq \$hasHandleExitBeenCalled ]
    then
        return
    fi

    hasHandleExitBeenCalled=1

    if [ \$lastExitCode == \$EXIT_CODE_BYE ]
    then
        echo "Have a nice day!"
    fi
}

# Display the source code of this file
howItWorks() {
    if [ \$# -lt 1 ]
    then
        less "\$0"

        return
    fi

    less --pattern="\$@" "\$0"
}

# List all functions that do not begin with an underscore _
_listAvailableFunctions() {
    cat \$0 | grep -E '^[a-z]+[a-zA-Z0-9_]*\(\) \{$' | sed 's#() {\$##' | sort
}

if [ \$# -eq 0 ]
then
    _listAvailableFunctions
    exit
fi

hasHandleExitBeenCalled=0
trap _handleExit exit err

"\$@"
END
}

fileName="please_${suffix}.sh"

if [ -f "$fileName" ]; then
    echo -e "file \e[33m$fileName\e[0m already exists.\n\nPlease remove it first:\n\e[33mrm $fileName\e[0m"
    exit 1
fi

echo "Creating script ${fileName}..."
createExecutableFile "$fileName"
writeScriptTemplate "$fileName"
echo -e "Done. \e[32mEnjoy!\e[0m"
