#!/bin/php
<?php

/**
 * Format json strings to be more readable.
 */

if (count($argv) <= 1) {
    echo "Please pass some json data as first argument of the command.\n";
    die;
}

function formatJsonToBeHumanlyReadable(string &$jsonData, int $tabSpaceCount = 4)
{
    $depth = 0;

    for ($i = $start = 0; $i < strlen($jsonData); $i++) {
        if ($jsonData[$i] === ',') {
            $start = $i + 1;
        } elseif ($jsonData[$i] === '{' || $jsonData[$i] === '[') {
            ++$depth;
            $start = $i + 1;
        } elseif ($jsonData[$i] === '}' || $jsonData[$i] === ']') {
            --$depth;
            $start = $i;
        } else {
            continue;
        }

        $jsonData = substr_replace($jsonData, "\n" . str_repeat(' ', $tabSpaceCount * $depth), $start, 0);
        $i += $tabSpaceCount * $depth + 1;
    }
}

$jsonToFormat = $argv[1];

formatJsonToBeHumanlyReadable($jsonToFormat);
echo "$jsonToFormat\n";


