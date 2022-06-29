#! /bin/bash

#SCRIPT_NAME=$(basename $0)
#SCRIPT_DIRECTORY=$(dirname $0)
SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_DIRECTORY=$(dirname $BASH_SOURCE)

_askConfirmationDefaultYes() {
    echo -e "\e[1mContinue?\e[0m [YES/no] "
    read answer

    if [[ ${answer,,} =~ ^n ]]; then
        echo "no"

        return 1
    fi

    echo "yes"
    return 0
}

_askConfirmationDefaultNo() {
    echo -e "\e[1mContinue?\e[0m [yes/NO] "
    read answer

    if [[ ${answer,,} =~ ^y ]]; then
        echo "yes"
        return 0
    fi

    echo "no"

    return 1
}

findHardLinksOfAFile() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mfileHere\e[0m"

        return 1
    fi

    find / -inum $(ls -i $1 | awk '{ print $1; }') 2> /dev/null
}

calculateElapsedTime() {
    if [ $# -lt 2 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mstartDate endDate\e[0m"

        return 1
    fi

    local startTimestamp=$(date '%s' --date="$1")
    local endTimestamp=$(date '%s' --date="$2")
    echo $(( $endTimestamp - $startTimestamp ))
}

guessAge() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mbirthday\e[0m"

        return 1
    fi

    local nowTimestamp=$(date '+%s')
    local birthdayTimestamp=$(date '+%s' --date="$1")
    local elapsedTime=$(( $nowTimestamp - $birthdayTimestamp ))

    echo $(( $elapsedTime / (365 * 24 * 3600) ))
}

appendToEndOfFile() {
    if [ $# -lt 2 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mfileName contentToAppend\e[0m"

        return 1
    fi

    sed -i '$a\'"$2" "$1"
}

convertDecimalToHexadecimal() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mdecimalValue\e[0m"

        return 1
    fi

    printf '%x' "$1"
}

convertHexadecimalToDecimal() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mhexadecimalValue\e[0m"

        return 1
    fi

    echo $((16#$1))
}

getAsciiCodeFromCharacter() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mcharacterHere\e[0m"

        return 1
    fi

    printf "%d\n" "'$1'"
}

getCharacterFromAsciiCode() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33masciiCodeHere\e[0m"

        return 1
    fi

    awk -v char=65 "BEGIN { printf \"%c\n\", $1; exit }"
}

getFileLastLine() {
    tail --lines=1 "$@"
}

getFileFirstLine() {
    head --lines=1 "$@"
}

getLineContainingPattern() {
    if [ $# -lt 2 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mfileNameHere patternHere\e[0m"

        return 1
    fi

    cat --number "$1" | grep --perl-regexp "$2" | awk '{print $1;}'
}

getCalendar() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33myearHere [destinationDirectoryHere]\e[0m"

        return 1
    fi

    local destinationDirectory="${2:-.}"
    local year="$1"

    curl "https://www.calendriergratuit.fr/images/annuel2/calendrier-${year}-0.jpg" -o "${destinationDirectory}/calendrier-${year}-0.jpg"
    curl "https://www.calendriergratuit.fr/images/annuel2/calendrier-${year}-1.jpg" -o "${destinationDirectory}/calendrier-${year}-1.jpg"
    cat << ZOG > "$destinationDirectory/calendar.html"
<div style="text-align: center; margin-bottom: 1cm;">
    <img src="./calendrier-${year}-0.jpg" alt="" style="width: 15cm; margin: 1cm;">
</div>
<div style="text-align: center;">
    <img src="./calendrier-${year}-1.jpg" alt="" style="width: 15cm; margin: 1cm;">
</div>
ZOG
}

createDummyFile() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mfileNameHere contentHere\e[0m"
        echo -e "\n\e[1mCreating dummyFile.\e[0m"
        _askConfirmationDefaultNo || exit
    fi

    local fileName="$1"
    local content="$2"

    echo ${content:-"apple
orange
pear
raspberry
cherry"} > ${fileName:-"dummyFile"}
}

searchInFiles() {
    if [ $# -lt 2 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mstringToSearchHere directoryHere\e[0m"

        return 1
    fi

    grep --dereference-recursive "$@"
}

trackFileChanges() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mfileNameHere\e[0m"

        return 1
    fi

    tail --follow=name --retry "$1"
}

# Get the last part of a file name
extractFileName() {
    echo ${@##*/}
}

openHtmlContent() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mhtmlContentHere\e[0m"

        return 1
    fi
    local temporaryFile='/tmp/please_openClipboardContentInFirefox.html'

    echo "$@" > "$temporaryFile"
    firefox "$temporaryFile"
}

replaceInFile() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mfileName stringToReplace replacement\e[0m"

        return 1
    fi

    local file="$1"
    local stringToReplace=$(echo "$2" | sed 's/#/\\#/')
    local replacement=$(echo "$3" | sed 's/#/\\#/')

    sed "s#$stringToReplace#$replacement#" "$file"

    echo "Apply changes"
    _askConfirmationDefaultYes || return

    sed -i "s#$stringToReplace#$replacement#" "$file"
}

replaceSpaceByUnderscoreInFileNamesInCurrentDirectory() {
    for file in *; do mv "$file" $(echo "$file" | tr ' ' '_'); done
}

replaceSpaceByUnderscoreInFileName() {
    if [ $# -lt 1 ]; then
        echo -e "
${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mfileHere\e[0m
"

        return 1
    fi

    local file="$@"
    mv "$file" $(echo "$file" | tr ' ' '_')
}

printLinesBetweenPatternsExcludingPatternsUsingPipe() {
    if [ $# -lt 2 ]; then
        echo -e "
${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mstartPatternHere endPatternHere\e[0m
"

        return 1
    fi
    local startPattern="$1"
    local endPattern="$2"

    sed --quiet "1,/$startPattern/d; /$endPattern/q; p"
}

findAddressByCoordinates() {
    if [ $# -lt 2 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mlatitudeHere longitudeHere\e[0m

latitude: 44.73594
longitude: 5.33936"

        return 1
    fi

    curl "https://nominatim.openstreetmap.org/reverse.php?lat=$1&lon=$2&format=jsonv2"
}

findAddressByCity() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mcityHere [countryHere]\e[0m"

        return 1
    fi

    curl "https://nominatim.openstreetmap.org/search.php?city=${1}&country=${2}&format=jsonv2"
}

findAddress() {
    if [ $# -lt 1 ]; then
        echo -e "${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mqueryHere\e[0m"

        return 1
    fi

    curl "https://nominatim.openstreetmap.org/search.php?q=$1&format=jsonv2"
}

# https://jwt.io/introduction
decodeJwt() {
    if [ $# -lt 1 ]; then
        printf "
# https://jwt.io

${SCRIPT_NAME} ${FUNCNAME[0]} \e[33mjwtHere\e[0m
"

        return 1
    fi

    local jwt="$1"
    local header="$(printf $jwt | cut -d '.' -f1 | base64 --decode --ignore-garbage)"
    local payload="$(printf $jwt | cut -d '.' -f2 | base64 --decode --ignore-garbage)"
    local signature="$(printf $jwt | cut -d '.' -f3)"

    echo $header | jq '.'
    echo $payload | jq '.'
}

editMe() {
    vim $0
}

# Display the source code of this file
howItWorks() {
    if [ $# -lt 1 ]; then
        less "$0"

        return
    fi

    less --pattern="$@" "$0"
}

# List all functions that do not begin with an underscore _
_listAvailableFunctions() {
    cat $0 | grep -E '^[a-z]+[a-zA-Z0-9_]*\(\) \{$' | sed 's#() {$##' | sort
}

if [ $# -eq 0 ]; then
    _listAvailableFunctions
    exit
fi

"$@"
