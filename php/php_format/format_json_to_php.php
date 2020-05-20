#!/bin/php
<?php

if (count($argv) <= 1) {
    echo "Please pass some json data as first argument of the command.\n";
    die;
}

function formatJsonToPhpArray(string $jsonData)
{
    $phpCode = str_replace('{', '[', $jsonData);
    $phpCode = str_replace('}', ']', $phpCode);
    $phpCode = str_replace(': ', ' => ', $phpCode);

    return $phpCode;
}

$jsonToFormat = $argv[1];

echo formatJsonToPhpArray($jsonToFormat) . "\n";


