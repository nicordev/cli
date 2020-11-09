#!/bin/php
<?php

if (count($argv) <= 1) {
    echo "Please pass a timestamp in seconds.\n";
    die;
}

function readTimestamp($timestamp) {
    return date(DATE_COOKIE, $timestamp);
}

echo readTimestamp($argv[1])."\n";
