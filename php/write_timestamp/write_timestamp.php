#!/bin/php
<?php

$styleStrong = "\e[33m";
$styleNormal = "\e[0m";

if (count($argv) <= 1) {
    echo "Please pass a date like {$styleStrong}'2020-01-01 15:21:14'{$styleNormal}\n";
    die;
}

function createTimestampFromDate(string $date) {
    return (new DateTime($date))->getTimestamp();
}

echo createTimestampFromDate($argv[1])."\n";
